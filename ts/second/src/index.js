"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const singleton_1 = require("./patrondisenio/singleton");
console.log("este es un comentario con ts-node");
var s = singleton_1.Singleton.getInstance();
s.addMessage("hola mundo");
//otra parte del archiv
s.addMessage("compi1");
//otra parte del codigo
console.log(s.getMessage());
console.log(s.getMessage());
