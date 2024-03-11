import fs from 'node:fs/promises'
import path from 'node:path'
import csv from 'csv-parser'
import { pool } from './db.js'

export const index = async (req, res) => {
  try {
    const pathToFile = 'index.html'
    const html = await fs.readFile(pathToFile, 'utf-8')
    res.writeHead(200, { 'Content-Type': 'text/html' })
    res.end(html)
  } catch (error) {
    console.error(error)
    res.writeHead(500, { 'Content-Type': 'text/html' })
    res.end('<h1>Error interno del servidor</h1>')
  }
}
export const getUsers = async (req, res) => {
  try {
    const [rows] = await pool.query('SELECT * FROM users')

    res.writeHead(200, { 'Content-Type': 'application/json' })
    res.end(JSON.stringify(rows))
  } catch (error) {
    console.error(error)
    res.writeHead(500, { 'Content-Type': 'application/json' })
    res.end(JSON.stringify({ message: 'Error interno del servidor' }))
  }
}
export const exportUsers = async (req, res) => {
    try {
      const [rows] = await pool.query('SELECT * FROM users')
      const users = rows.map(row => Object.values(row).join(','))
  
      const csvContent = ['id,nombres,apellidos,direccion,correo,dni,edad,fecha_creacion,telefono', ...users].join('\n')
  
      res.writeHead(200, {
        'Content-Type': 'text/csv',
        'Content-Disposition': 'attachment; filename=usuarios.csv'
      })
      res.end(csvContent)
    } catch (error) {
      console.error(error)
      res.writeHead(500, { 'Content-Type': 'application/json' })
      res.end(JSON.stringify({ message: 'Error interno del servidor' }))
    }
  }
  export const importUsers = async (req, res) => {
    try {
        const users = [];
        fs.createReadStream('usuarios.csv')
            .pipe(csvParser())
            .on('data', (row) => {
                users.push(row);
            })
            .on('end', async () => {
                try {
                    for (const user of users) {
                        const { id, nombres, apellidos, direccion, correo, dni, edad, fecha_creacion, telefono } = user;
                        const [existingUser] = await pool.query('SELECT * FROM usuarios WHERE dni = ?', [dni]);
                        if (!existingUser.length) {
                            const query = 'INSERT INTO usuarios (id, nombres, apellidos, direccion, correo_electronico, dni, edad, fecha_creacion, telefono) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)';
                            await pool.execute(query, [id, nombres, apellidos, direccion, correo, dni, edad, fecha_creacion, telefono]);
                        }
                    }
                    const [importedUsers] = await pool.query('SELECT * FROM usuarios');
                    res.status(200).json(importedUsers);
                } catch (error) {
                    console.error('Error al insertar usuarios:', error);
                    res.status(500).json({ message: 'Error interno del servidor' });
                }
            });
    } catch (error) {
        console.error('Error al leer el archivo CSV:', error);
        res.status(500).json({ message: 'Error interno del servidor' });
    }
};
