import { Type } from "./type";

export class Symbol{
    constructor(
        public value: any,
        public id: string,
        public type: Type 
    ){}
}



//mas facil de manejar
//new Symbol("hola", "variable1",Type.BOOLEAN )
//new Symbol("hola", "variable2",Type.NUMBER )
//new Symbol("hola", "variable3",Type.STRING )
//new Symbol("hola", "variable4",Type.STRING )
//
//
// mas complicado
//new Symbol("hola", "variable1","bol" )
//new Symbol("hola", "variable1","bool" )
//new Symbol("hola", "variable1","bolena" )
//new Symbol("hola", "variable2","numero" )
//new Symbol("hola", "variable3","string" )
//new Symbol("hola", "variable4","string" )