import { Expression } from "../abstract/express";
import { Instruccion } from "../abstract/instruccion";
import { Environment } from "../symbol/enviroment";

export class If extends Instruccion {
  constructor(
    public condicon: Expression,
    public bloque1: Instruccion,
    public bloque2: Instruccion,
    line: number,
    column: number
  ) {
    super(line, column);
  }

  public execute(env: Environment) {
    const result = this.condicon.execute(env);

    if (result.value) {
      this.bloque1.execute(env);
    } else {
      this.bloque2.execute(env);
    }
  }
}
