import http from 'node:http'
import { PORT } from './config.js'
import { getUsers, importUsers, exportUsers, index } from './library.js'

const server = http.createServer(async (req, res) => {
  if (req.url === '/') {
    index(req, res)
  } else if (req.url === '/api/usuarios' && req.method === 'GET') {
    getUsers(req, res)
  } else if (req.url === '/api/usuarios/export' && req.method === 'GET') {
    exportUsers(req, res)
  } else if (req.url === '/api/usuarios/import' && req.method === 'POST') {
    await importUsers(req, res)
  } else {
    res.writeHead(404, { 'Content-Type': 'application/json' })
    res.end(JSON.stringify({ message: 'Not found' }))
  }
})

server.listen(PORT, () => console.log(`Server running on: http://localhost:${PORT}`))