var http = require('http')

var server = http.createServer(handler)

function handler(req, res) {
  res.write('Hello')
  res.end()
}

server.listen(8000)
