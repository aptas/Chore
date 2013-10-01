
var express = require('express')
  , http = require('http')
  , https = require('https')
  , fs = require('fs')
  , path = require('path');

var options = {
    key: fs.readFileSync('./ssl/server.key'),
    cert: fs.readFileSync('./ssl/server.crt'),
};

var app = express();
var port = process.env.PORT || 3000;
app.set('port', port);
app.use(express.static(path.join(__dirname, 'www')));

var server = http.createServer(app).listen(port, function(){
  console.log("Express server listening on port " + port);
});