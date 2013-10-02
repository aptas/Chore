
var express = require('express')
  , http = require('http')
  , fs = require('fs')
  , path = require('path');

var app = express();
var port = process.env.PORT || 3000;
app.set('port', port);
app.use(express.static(path.join(__dirname, 'www')));

var server = http.createServer(app).listen(port, function(){
  console.log("Express server listening on port " + port);
});