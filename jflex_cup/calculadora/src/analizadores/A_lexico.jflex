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

num = [0-9]+


%%
<YYINITIAL>{

    "-"           { return new Symbol(Simbolos.trest, yycolumn, yyline, yytext());     }
    "+"           { return new Symbol(Simbolos.tsuma, yycolumn, yyline, yytext());     }
    {num}         { return new Symbol(Simbolos.tnum, yycolumn, yyline, yytext());      }


}

[ \t\r\n\f]              { /* Espacios en blanco, se ignoran */	}

.                     	 { System.out.println("Error Lexico : "+yytext()+ "Linea"+yyline+" Columna "+yycolumn);}


