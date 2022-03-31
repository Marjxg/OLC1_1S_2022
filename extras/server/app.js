var express = require('express');
var morgan = require('morgan');
var cors = require("cors");
var app= express();
var corsOptions = { origin: true, optionsSuccessStatus: 200 };


app.use(morgan('dev'));
app.use(express.json())
app.use(cors(corsOptions));
app.use(express.urlencoded({extended: true}));

var incremental= 0
var puerto = 8080

app.listen(puerto , function () {
    console.log(`app escuchando en el puerto ${puerto}!`);
})

app.get('/', function (req, res) {
    incremental++;
    res.json({mensaje: "hola mundo"}).status(200)
})

app.get('/getIncremental', function (req, res) {
    res.json({incremental: incremental})
})

app.get('/retornoTexto', function (req, res) {
    res.send('Este mensaje esta en texto')
})

app.post('/setIcremental', function (req, res) {
    incremental= req.body.dato 
    var texto= req.body.texto 
    //codigo, que tenga algun algoritmo en especifico
    res.json({msg: "operacion con exito!"})
})
