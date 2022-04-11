import { Instruccion } from "../abstract/instruccion";
import { Environment } from "../symbol/enviroment";

export class PrintEnv extends Instruccion {
  constructor(
    line: number,
    column: number
  ) {
    super(line, column);
  }

  public execute(env: Environment) {
    console.log(env.getEnv())    
  }
}