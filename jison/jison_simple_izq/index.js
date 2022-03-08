var fs = require('fs'); 
var grammatica = require('./gramatica');


fs.readFile('./entrada.txt', (err, data) => {
    if (err) throw err;
    grammatica.parse(data.toString());
});