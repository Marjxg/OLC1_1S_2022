package analizadores;
import java_cup.runtime.*;

//@author moi

%%

%public
%class Analizador_Lexico
%cupsym Simbolos
%cup
%char
%column
%full
%ignorecase
%line
%unicode

letra = [a-zA-Z]
id = {letra}+


%state ESTADOCADENA

%%



<YYINITIAL> ","     {
                    System.out.println("Reconocio token:<coma> lexema:"+yytext());
                    return new Symbol(Simbolos.coma, yycolumn, yyline, yytext());
                    }

<YYINITIAL> {id}    {
                    System.out.println("Reconocio token:<id> lexema:"+yytext());
                    return new Symbol(Simbolos.id, yycolumn, yyline, yytext());
                    }

<YYINITIAL> "\""    {
                    System.out.println("Inicio del estado cadena");
                    yybegin(ESTADOCADENA);    
                    }


                    <ESTADOCADENA> [^\"] { }


                    <ESTADOCADENA> "\"" {
                                        System.out.println("Fin del estado cadena");
                                        yybegin(YYINITIAL); 
                                        System.out.println("Reconocio token:<cadena>");
                                        return new Symbol(Simbolos.cadena, yycolumn, yyline, yytext());   
                                        }

[ \t\r\n\f]         {
                    /* Espacios en blanco, se ignoran */    
                    }

.                   {                     
                    }