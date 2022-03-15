export class Singleton{


    private static instance: Singleton

    private mensaje : string =""
    private consola: string=""
    


    private constructor() { }

    public static getInstance(): Singleton {
        if (!Singleton.instance) {
            Singleton.instance = new Singleton();
        }
        return Singleton.instance;
    }


    public addMessage(data:string){
        this.mensaje+= data
    }
    public getMessage():string{
        return this.mensaje
    }




}