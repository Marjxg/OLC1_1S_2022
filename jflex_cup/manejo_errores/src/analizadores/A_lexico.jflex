package analizadores;
import java_cup.runtime.*;
import java.util.LinkedList;

//@author moi

%%
%{
    public static LinkedList<TError> errores = new LinkedList<TError>(); 
%}

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

%%

<YYINITIAL> ","     {
                    System.out.println("Reconocio token:<coma> lexema:"+yytext());
                    return new Symbol(Simbolos.coma, yycolumn, yyline, yytext());
                    }

<YYINITIAL> {id}    {
                    System.out.println("Reconocio token:<id> lexema:"+yytext());
                    return new Symbol(Simbolos.id, yycolumn, yyline, yytext());
                    }

[ \t\r\n\f]         {
                    /* Espacios en blanco, se ignoran */    
                    }

.                   {
                    TError tmp= new TError("Lexico", yytext(),"Caracter no encontrado", yyline, yycolumn );
                    errores.add(tmp);                    
                    }