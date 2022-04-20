import { Expression } from "../abstract/express";
import { Instruccion } from "../abstract/instruccion";
import { Environment } from "../symbol/enviroment";
import { Type } from "../symbol/type";

export class Declaracion extends Instruccion {
  constructor(
    public nombre: string,
    public tipo: Type,
    public expresion: Expression,
    line: number,
    column: number
  ) {
    super(line, column);
  }

  public execute(env: Environment) {
    let exp = this.expresion.execute(env);
    // console.log(exp.type);
    // console.log(this.tipo);

    if (exp.type == this.tipo) {
      const condicion = env.guardar_variable(this.nombre, exp.value, this.tipo);
      if (condicion) {
        console.log("variable [" + this.nombre + "] ingresada...");
      } else {
        console.log("variable [" + this.nombre + "] no ingresada...");
      }
    } else {
      console.log(
        "error semantico, declaracion de variable [" +
          this.nombre +
          "] no correcta por tipo"
      );
      console.log("expre->",exp);
      
    }
  }
}
