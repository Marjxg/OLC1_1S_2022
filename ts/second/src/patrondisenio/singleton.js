"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.Singleton = void 0;
class Singleton {
    constructor() {
        this.mensaje = "";
    }
    static getInstance() {
        if (!Singleton.instance) {
            Singleton.instance = new Singleton();
        }
        return Singleton.instance;
    }
    addMessage(data) {
        this.mensaje += data;
    }
    getMessage() {
        return this.mensaje;
    }
}
exports.Singleton = Singleton;
