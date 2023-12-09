// app.js

// Importa el módulo Express
const express = require('express');

// Crea una instancia de la aplicación Express
const app = express();

// Ruta principal
app.get('/', (req, res) => {
  res.send('¡Hola desde la ruta principal!');
});

// Ruta secundaria
app.get('/ruta-secundaria', (req, res) => {
  res.send('¡Hola desde la ruta secundaria!');
});

// Puerto en el que la aplicación escuchará
const PORT = process.env.PORT || 3000;

// Inicia el servidor
app.listen(PORT, () => {
  console.log(`Servidor escuchando en el puerto ${PORT}`);
});
