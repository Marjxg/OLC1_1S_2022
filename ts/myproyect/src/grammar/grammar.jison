 
%{
    const {Declaracion} = require('../instruccion/declaracion');
%}

%lex
%options case-insensitive

%%




\s+                   /* skip whitespace */
"//".*                              // comentario simple línea
[/][*][^*]*[*]+([^/*][^*]*[*]+)*[/] // comentario multiple líneas


"var"                  return 'var'
"number"               return 'number'


";"                    return ';'
":"                    return ':'
"="                    return '='

([a-zA-Z_])[a-zA-Z0-9_ñÑ]*	return 'id';

<<EOF>>		            return 'EOF'

.   { 
        console.log("error lexico")
    }

/lex

%start Init

%%

Init    
    : Instructions EOF          {  return $1;  }
;

Instructions
    : Instructions Instruction  { $1.push($2); $$ = $1; }
    | Instruction               { $$ = [$1];            }
;

Instruction
    : DECLARACION                {  $$ = $1;  }
;

DECLARACION
    : 'var' 'id' ':' 'number' '=' ';'{ $$= new Declaracion($2,$4, @1.first_line, @1.first_column)}
;