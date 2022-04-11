 
%{
    const {Declaracion} = require('../instruccion/declaracion');
    const {Type} = require('../symbol/type');
    const {Arithmetic} = require('../expression/aritmeticas');
    const {ArithmeticOption} = require('../expression/aritmeticOption');
    const {Literal} = require('../expression/literal');
    const {PrintEnv} = require('../instruccion/printEnv');
    const {Asignacion} = require('../instruccion/asignacion');
    const {Print} = require('../instruccion/print');
%}

%lex
%options case-insensitive

number  [0-9]+      
cadena   "\""  [^\"]* "\""   
bool    "true"|"false"     

%%




\s+                   /* skip whitespace */
"//".*                              // comentario simple línea
[/][*][^*]*[*]+([^/*][^*]*[*]+)*[/] // comentario multiple líneas



{number}               return 'expreNUMBER' 
{cadena}               return 'expreCADENA' 
{bool}                 return 'expreBOOL' 

"var"                  return 'var'
"number"               return 'tnumber'
"string"               return 'tstring'
"bool"                 return 'tbool'
"print"                return 'tprint'
"printEnv"             return 'tgprintEnv'

"+"                    return '+'
"-"                    return '-'
";"                    return ';'
":"                    return ':'
"="                    return '='
")"                    return ')'
"("                    return '('

([a-zA-Z_])[a-zA-Z0-9_ñÑ]*	return 'id';

<<EOF>>		            return 'EOF'

.   { 
        console.log("error lexico")
    }

/lex


%left '+' '-'

%start Init

%%

Init    
    : Instructions EOF  {return $1}
;

Instructions
    : Instructions Instruction  {$1.push($2); $$ = $1;}
    | Instruction               {$$ = [$1]}
;

Instruction
    : DECLARACION           {$$ = $1}
    | DECLARACION ';'       {$$ = $1}
    | PRINTENVIROMENT       {$$ = $1}
    | PRINTENVIROMENT ';'   {$$ = $1}
    | ASIGNACION            {$$ = $1}
    | ASIGNACION ';'        {$$ = $1}
    | PRINT                 {$$ = $1}
    | PRINT ';'             {$$ = $1}
;

DECLARACION
    : 'var' 'id' ':' TIPOS '='  EXPRE   {$$= new Declaracion($2,$4,$6, @1.first_line, @1.first_column)}
;

PRINTENVIROMENT
    : tgprintEnv '(' ')'  {$$= new PrintEnv(@1.first_line, @1.first_column)}
;

ASIGNACION
    : 'id' '='  EXPRE   {$$= new Asignacion($1,$3, @1.first_line, @1.first_column)}
;

PRINT
    : 'tprint' '(' EXPRE ')'  {$$= new Print($3, @1.first_line, @1.first_column)}
;

EXPRE
    : EXPRE '+' EXPRE {$$=new Arithmetic($1, $3,ArithmeticOption.MAS,   @1.first_line, @1.first_column)}
    | EXPRE '-' EXPRE {$$=new Arithmetic($1, $3,ArithmeticOption.MENOS, @1.first_line, @1.first_column)}
    | F               {$$= $1}
;

F
    : expreNUMBER {$$= new Literal($1,Type.NUMBER,  @1.first_line, @1.first_column)}
    | expreCADENA {$$= new Literal($1,Type.STRING,  @1.first_line, @1.first_column)}
    | expreBOOL   {$$= new Literal($1,Type.BOOLEAN, @1.first_line, @1.first_column)}
;

TIPOS
    : tbool   {$$=Type.BOOLEAN}
    | tnumber {$$=Type.NUMBER}
    | tstring {$$=Type.STRING}
;