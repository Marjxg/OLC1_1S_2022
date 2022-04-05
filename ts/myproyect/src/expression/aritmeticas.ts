import { Expression } from "../abstract/express"
import { Retorno } from "../abstract/Retorno"
import { Environment } from "../symbol/enviroment"
import { Type } from "../symbol/type"
import { ArithmeticOption } from "./aritmeticOption"

export class Arithmetic extends Expression {

    constructor(
        private left: Expression,
        private right: Expression,
        private type: ArithmeticOption,
        line: number,
        column: number) {
        super(line, column)
    }

    public execute(env: Environment): Retorno {

        let result: Retorno ={
            value:null,
            type:Type.error
        }

        const nodoIzq = this.left.execute(env)
        const nodoDer = this.right.execute(env)

        /**
         * suma
         */
        if (this.type == ArithmeticOption.MAS) {

   
            if (nodoDer.type == Type.NUMBER && nodoIzq.type == Type.NUMBER) {
                result = { 
                    value: (nodoIzq.value + nodoDer.value), 
                    type: Type.NUMBER 
                }
            }
            
            //demas validadionces
            
        }else if (this.type == ArithmeticOption.MENOS) {

   
            if (nodoDer.type == Type.NUMBER && nodoIzq.type == Type.NUMBER) {
                result = { 
                    value: (nodoIzq.value - nodoDer.value), 
                    type: Type.NUMBER 
                }
            }
            
            //demas validadionces
            
        }


        return result
    }


}

