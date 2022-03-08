%{
	var flag=0;
    var tmp = "";
    // author: Moises Gonzalez Fuentes 1 semestre 2022
%}
%lex

%s cadena
%s comentarioLinea
%s comentarioMulti

%%

//simbolos o palabras reservadas

","                 {
                        console.log("reconoci token <coma> con lexema: "+yytext);
                        return 'coma';
                    }

<INITIAL>["]    {
                    this.begin('cadena')
                }

<cadena>[^"]    {
                    tmp= tmp +  yytext;
                }
<cadena>["]     {
                    //this.begin('INITIAL'); 
                    this.popState();
                    console.log("reconoci token <cadena> con lexema: "+tmp)
                    tmp=""
                    return 'ER_cadena'
                }


[ \r\t]+            {}
\n                  {}

[a-zA-ZñÑáéíóú]+              {
                        console.log("reconoci token <palabra> con lexema: "+yytext)
                        return 'PALABRA';
                    }  

<<EOF>>             return 'EOF'; 

.                   { 
                        console.error('Este es un error léxico: ' + yytext + ', en la linea: ' + yylloc.first_line + ', en la columna: ' + (yylloc.first_column+1)); 
                    }
/lex


%start ini

%%

ini
	: ER_cadena bloque ER_cadena EOF { console.log("termine de analizar, recursiva por la izq c:, usando el archivo sh");}
;

bloque
	: bloque coma PALABRA
    | PALABRA             
;

