import { Expression } from "../abstract/express";
import { Instruccion } from "../abstract/instruccion";
import { Environment } from "../symbol/enviroment";

export class For extends Instruccion {
  constructor(
    public declaraccion:Instruccion,
    public condicon:Expression,
    //public incremento:Instruccion,
    public bloque: Instruccion,
    line: number,
    column: number
  ) {
    super(line, column);
  }

  public execute(env: Environment) {

    //creamos un nuevo env
    const newEnv= new Environment(env)
    //ejecutamos la primera instuccion que puede ser una declaracion
    this.declaraccion.execute(newEnv)
    
    //por cada iteracion necesitamos 
    const newEnv_= new Environment(newEnv)
    this.bloque.execute(newEnv_)


    //puden usar una funcion while, la condicion para repetir el ciclo lo sacamos desde la condicion con un execute() y ejecutamos el incremento(en este momento no lo cree), despues se vuelve hacer la conidicon para que el while sepa si se hace otra vez
    // while(this.condicon.execute(newEnv).value){

    //   this.bloque.execute()
    //   this.incremento.execute()
    // }





    
  }
}