%{
	var flag=0;
    // author: Moises Gonzalez Fuentes 1 semestre 2022
%}
%lex
numero  [0-9]+   

%%

//simbolos o palabras reservadas


{numero}            {
                        return 'numero'
                    }


"+"                 {
                        console.log("reconoci token <simbolo> con lexema: "+yytext);
                        return '+';
                    }
"-"                 {
                        console.log("reconoci token <simbolo> con lexema: "+yytext);
                        return '-';
                    }

[ \r\t]+            {}
\n                  {}



<<EOF>>             return 'EOF'; 

.                   { 
                        console.error('Este es un error léxico: ' + yytext + ', en la linea: ' + yylloc.first_line + ', en la columna: ' + (yylloc.first_column+1)); 
                    }
/lex

%left '+' '-'

%start ini

%%

ini
	: E EOF { console.log("termine de analizar");}
;

E
	: E '-' E
    | E '+' E
    | numero
;




