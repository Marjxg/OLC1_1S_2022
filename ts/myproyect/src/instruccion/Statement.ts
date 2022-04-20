import { Instruccion } from "../abstract/instruccion";
import { Environment } from "../symbol/enviroment";

export class Statement extends Instruccion {
  constructor(public code: Array<Instruccion>, line: number, column: number) {
    super(line, column);
  }

  public execute(env: Environment) {
    let new_env = new Environment(env);
    for (const x of this.code) {
      x.execute(new_env);
    }
  }
}
