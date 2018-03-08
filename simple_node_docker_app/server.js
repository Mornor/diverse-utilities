'use strict';

const express = require('express');
const path = require('path');
const { Client } = require('pg');

// Constants
const PORT = 8080;
const HOST = '0.0.0.0';

// App
const app = express();

// Define routes and actions
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname +'/public/index.html'));
});

app.get('/get_db', (req, res) => {

  const client = new Client({
    connectionString: '',
    ssl: true,
  });

  client.connect();

  // Test connection with basic query
  client.query('SELECT table_schema,table_name FROM information_schema.tables;', (err, result) => {
    if (err) throw err;
    for (let row of result.rows) {
      return res.send(JSON.stringify(row));
    }
    client.end();
  });
});

app.listen(PORT, HOST);
