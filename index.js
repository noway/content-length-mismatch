const express = require('express');
const http = require('http');

const port = parseInt(process.argv[2], 10);

const app = express();
app.use(express.text());

http.createServer(app).listen(port, () => {
    console.log(`Server listening on port ${port}`);
});
