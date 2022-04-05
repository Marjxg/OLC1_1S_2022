import { Expression } from "../abstract/express";
import { Instruccion } from "../abstract/instruccion";
import { Environment } from "../symbol/enviroment";
import { Type } from "../symbol/type";

export class Declaracion extends Instruccion {
  constructor(
    public nombre: string,
    public tipo: Type,
    public expresion:Expression,
    line: number,
    column: number
  ) {
    super(line, column);
  }

  public execute(env: Environment) {
    //preguntar si la variable es unica y si los tipos con correctos, antes de ingresar a la tabla de simbolo
    env.guardar_variable(this.nombre, 1, this.tipo);
    console.log("acabo de guardar una variable en la tabla de simbolos");
    
    let olc= this.expresion.execute(env)
    
    console.log(olc)

    //esta condicion tiene que ir de primero, solo la coloque en este lado para que vieran como valido
    if (olc.type== Type.NUMBER){
      //condiciones correctas
      console.log("son correctas");
    }else{
      //estas trando de asignar una cadena a un
      console.log("errro semantico");
      
    }
    
    //console.log(env);
  }
}