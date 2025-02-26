require('dotenv').config();
const express = require('express');
const app = express();
const path = require('path');
const mysql = require('mysql2');
const bcrypt = require('bcrypt');

const PORT = process.env.PORT || 3000;


const OpenAI = require('openai');


const openai = new OpenAI({
    apiKey: process.env.OPENAI_API_KEY,
});

app.use(express.json());
app.use(express.static(path.join(__dirname, 'public')));


// Database connection setup
const db = mysql.createConnection({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_DATABASE
});

db.connect(err => {
    if (err) {
        console.error('Error connecting to the database: ' + err.stack);
        return;
    }
    console.log('Connected to database as ID ' + db.threadId);
});


// 

app.post('/chat', async (req, res) => {
    const { userId, chatTitle, message } = req.body;
    console.log('Received userId:', userId, 'chatTitle:', chatTitle, 'message:', message);

    if (!userId) {
        return res.status(400).json({ status: "error", error: "User ID is required" });
    }

    try {
        // Check if chat exists, if not create it
        let chatId;
        db.query('SELECT id FROM chats WHERE user_id = ? AND chat_title = ?', [userId, chatTitle], (err, results) => {
            if (err) throw err;
            if (results.length > 0) {
                chatId = results[0].id;
                insertMessageAndRespond(chatId, message, res);
            } else {
                db.query('INSERT INTO chats (user_id, chat_title) VALUES (?, ?)', [userId, chatTitle], (err, results) => {
                    if (err) throw err;
                    chatId = results.insertId;
                    insertMessageAndRespond(chatId, message, res);
                });
            }
        });

    } catch (error) {
        console.error('Error:', error);
        res.status(500).json({ status: "error", error: "Internal server error" });
    }
});

function insertMessageAndRespond(chatId, message, res) {
    // Save user message
    db.query('INSERT INTO messages (chat_id, sender, message_text) VALUES (?, ?, ?)', [chatId, 'user', message], (err, results) => {
        if (err) throw err;

        // Get AI response
        openai.chat.completions.create({
            messages: [
                { role: "system", content: "You are a helpful assistant." },
                { role: "user", content: message }
            ],
            model: "gpt-3.5-turbo",
            max_tokens: 1000,
        }).then(response => {
            const reply = response.choices[0].message.content;

            // Save AI response
            db.query('INSERT INTO messages (chat_id, sender, message_text) VALUES (?, ?, ?)', [chatId, 'urbanquest', reply], (err, results) => {
                if (err) throw err;
                res.json({ status: "success", response: reply });
            });
        }).catch(error => {
            console.error('Error:', error);
            res.status(500).json({ status: "error", error: "Internal server error" });
        });
    });
}





app.get('/getMessages', (req, res) => {
    const { chatTitle, userId } = req.query;

    if (!userId || !chatTitle) {
        return res.status(400).json({ status: "error", message: "User ID and chat title are required" });
    }

    db.query('SELECT id FROM chats WHERE user_id = ? AND chat_title = ?', [userId, chatTitle], (err, results) => {
        if (err) {
            console.error('Error fetching chat:', err);
            return res.status(500).json({ status: "error", message: "Internal server error" });
        }

        if (results.length === 0) {
            return res.json({ status: "success", messages: [] }); // Return an empty array if no chat is found
        }

        const chatId = results[0].id;

        db.query('SELECT sender, message_text FROM messages WHERE chat_id = ?', [chatId], (err, results) => {
            if (err) {
                console.error('Error fetching messages:', err);
                return res.status(500).json({ status: "error", message: "Internal server error" });
            }

            const messages = results.map(row => ({ sender: row.sender, text: row.message_text }));
            res.json({ status: "success", messages });
        });
    });
});
 

app.post('/signup', async (req, res) => {
    const { username, email, password } = req.body;

    if (!(email && password && username)) {
        res.status(400).json({ status: "error", error: "All input is required" });
        return;
    }

    try {
        const hashedPassword = await bcrypt.hash(password, 10);
        db.query('SELECT * FROM users WHERE email = ?', [email], (err, result) => {
            if (err) {
                console.error('Database error:', err);
                res.status(500).json({ status: "error", error: "Internal server error" });
                return;
            }
            if (result.length) {
                res.status(409).json({ status: "error", error: "User Already Exists. Please Login" });
            } else {
                db.query('INSERT INTO users (username, email, password) VALUES (?, ?, ?)', [username, email, hashedPassword], (err, result) => {
                    if (err) {
                        if (err.code === 'ER_DUP_ENTRY') {
                            res.status(409).json({ status: "error", error: "User Already Exists. Please Login" });
                        } else {
                            console.error('Database error:', err);
                            res.status(500).json({ status: "error", error: "Internal server error" });
                        }
                        return;
                    }
                    res.status(201).json({
                        status: "success", 
                        message: "User registered successfully",
                        email: email  // Include email in the response
                    });
                });
            }
        });
    } catch (error) {
        console.error('Error:', error);
        res.status(500).json({ status: "error", error: "Internal server error" });
    }
});


app.get('/getChats', (req, res) => {
    const { userId } = req.query;

    if (!userId) {
        return res.status(400).json({ status: "error", message: "User ID is required" });
    }

    db.query('SELECT chat_title FROM chats WHERE user_id = ?', [userId], (err, results) => {
        if (err) {
            console.error('Error fetching chats:', err);
            return res.status(500).json({ status: "error", message: "Internal server error" });
        }

        const chats = results.map(row => ({ chatTitle: row.chat_title }));
        res.json({ status: "success", chats });
    });
});

app.post('/login', async (req, res) => {
    const { email, password } = req.body;
    if (!(email && password)) {
        return res.status(400).json({ status: "error", error: "All input is required" });
    }
    try {
        db.query('SELECT * FROM users WHERE email = ?', [email], async (err, results) => {
            if (err) {
                throw err;
            }
            if (results.length > 0) {
                const user = results[0];
                if (await bcrypt.compare(password, user.password)) {
                    return res.status(200).json({
                        status: "success",
                        message: "Login successful",
                        userId: user.id,  // Return userId
                        username: user.username,
                        email: user.email
                    });
                } else {
                    return res.status(400).json({ status: "error", error: "Invalid Credentials" });
                }
            } else {
                return res.status(404).json({ status: "error", error: "User does not exist" });
            }
        });
    } catch (error) {
        console.error('Error:', error);
        return res.status(500).json({ status: "error", error: "Internal server error" });
    }
});





app.listen(PORT, () => {
    console.log(`Server running on http://localhost:${PORT}`);
});

