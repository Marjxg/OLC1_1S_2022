%{
	var flag=0;
    // author: Moises Gonzalez Fuentes 1 semestre 2022
%}
%lex

%%

","                 {
                        console.log("reconoci token <coma> con lexema: "+yytext);
                        return 'coma';
                    }


[ \r\t]+            {}
\n                  {}

[a-z]+              {
                        console.log("reconoci token <palabra> con lexema: "+yytext)
                        return 'PALABRA';
                    }  

<<EOF>>             return 'EOF'; 

.                   { 
                        console.error('Este es un error léxico: ' + yytext + ', en la linea: ' + yylloc.first_line + ', en la columna: ' + yylloc.first_column); 
                    }
/lex


%start ini

%%

ini
	: bloque EOF { console.log("termine de analizar, recursiva por la derecha c:");}
;

bloque
	: PALABRA coma bloque 
    | PALABRA               
;

