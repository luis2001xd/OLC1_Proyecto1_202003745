package Statpy;
import java_cup.runtime.*;

%%
//<!([\ \n]|[\\s -~]+)+!>

%{
    //Código de usuario
%}

%class Lexer  // definir como trabajara el scanner
%cup            // trabajar con cup
%public         // tipo publico
%char
%column
%line          // caracter por caracter
%unicode        // tipo de codigicacion para que acepte la  ñ u otro caracter
%ignorecase     // case insensitive


//símbolos y palabras reservadas


PARENTESIS_ABERTURA = "("
PARENTESIS_CIERRE = ")"
COMILLA = "\""
LLAVE_ABERTURA = "{"
LLAVE_CIERRE = "}"
SUMA = "+"
MENOS = "-"
MULT = "*"
DIVISION = "/"
MAYOR_QUE = ">"
MENOR_QUE = "<"
MAYOR_IGUAL = ">="
MENOR_IGUAL = "<="
DOBLE_IGUAL = "=="
DISTINTO = "!="
AND = "&&"
OR = "||"
NOT = "!"
CONCAT = "+"
INCREMENTO = "++"
DOSPTOS = ":"
PTOCOMA = ";"

//PALABRAS RESERVADAS
PRINT = "Console.Write"
INT = "int"
DOUBLE = "double"
CHAR = "char"
BOOLEAN = "bool"
T_F = "TRUE" | "FALSE"
STRING = "string"
IF = "if"
IGUAL = "="
ELSEIF = "else if"
ELSE = "else"
SWITCH = "switch"
CASE = "case"
FOR = "for"
WHILE = "while"
DO = "do"
MAIN = "main"
VOID = "void"
DEFAULT = "default"
BREAK = "break"
DEFINIR_GLOBALES = "DefinirGlobales"
NEWVALOR = "NewValor"
DOLAR = "$"
COMA = ","
GRAFICABARRAS = "GraficaBarras"
ARREGLO = "[]"
TITULO = "Titulo"
EJEX = "EjeX"
VALORES = "Valores"
TITULOEJEX = "TituloX"
TITULOEJEY = "TituloY"
GRAFICAPIE = "GraficaPie"

// ------> Expresiones Regulares

CARACTER = [^\r\n]
ENTER   = \r|\n|\r\n
COMENTARIOLINEA = "//" {CARACTER}* {ENTER}?
COMENTARIOMULTI = "/*" [^/]~ "*/"
VARIABLE = [a-zA-Z_][a-zA-Z0-9_]*

SPACE   = [\ \r\t\f\t]

ENTERO = [0-9]*
DECIMAL = [0-9]+("."[  |0-9]+)?
CADENA = [\"'][^\"\n']*[\"']
%%
{MAIN} {return new Symbol (sym.MAIN,yyline,yycolumn, yytext());}
{LLAVE_ABERTURA} {return new Symbol(sym.LLAVE_ABERTURA, yyline, yycolumn, yytext()); }
{VOID} {return new Symbol (sym.VOID,yyline,yycolumn, yytext());}
//terminal String VOID,MAIN,PARENTESIS_ABERTURA,PARENTESIS_CIERRE,LLAVE_ABERTURA,INT,VARIABLE,IGUAL,ENTERO,PTOCOMA;
{PRINT}  { return new Symbol(sym.PRINT, yyline, yycolumn,yytext());  }
{PARENTESIS_ABERTURA} { return new Symbol(sym.PARENTESIS_ABERTURA, yyline, yycolumn, yytext()); }

//{COMILLA} {return new Symbol(sym.COMILLA, yyline, yycolumn, yytext()); }

{LLAVE_CIERRE } { return new Symbol(sym.LLAVE_CIERRE, yyline, yycolumn, yytext()); }
{MAYOR_QUE} {return new Symbol(sym.MAYOR_QUE, yyline, yycolumn, yytext()); }
{MENOR_QUE} {return new Symbol(sym.MENOR_QUE, yyline, yycolumn, yytext()); }
{SUMA} {return new Symbol(sym.SUMA, yyline, yycolumn, yytext()); }
{MENOS} {return new Symbol(sym.MENOS, yyline, yycolumn, yytext()); }
{MULT} {return new Symbol(sym.MULT, yyline, yycolumn, yytext()); }
{DIVISION} {return new Symbol(sym.DIVISION, yyline, yycolumn, yytext()); }
{MAYOR_IGUAL} {return new Symbol(sym.MAYOR_IGUAL, yyline, yycolumn, yytext()); }
{MENOR_IGUAL} {return new Symbol(sym.MENOR_IGUAL, yyline, yycolumn, yytext()); }
{DOBLE_IGUAL} {return new Symbol(sym.DOBLE_IGUAL, yyline, yycolumn, yytext()); }
{DISTINTO} {return new Symbol(sym.DISTINTO, yyline, yycolumn, yytext()); }
{AND} {return new Symbol(sym.AND, yyline, yycolumn, yytext()); }
{OR} {return new Symbol(sym.OR, yyline, yycolumn, yytext()); }
{NOT} {return new Symbol(sym.NOT, yyline, yycolumn, yytext()); }
{INT} {return new Symbol(sym.INT, yyline, yycolumn, yytext()); }
{DOUBLE} {return new Symbol(sym.DOUBLE, yyline, yycolumn, yytext()); }
{CHAR} {return new Symbol(sym.CHAR, yyline, yycolumn, yytext()); }
{BOOLEAN} {return new Symbol(sym.BOOLEAN, yyline, yycolumn, yytext()); }
{STRING} {return new Symbol(sym.STRING, yyline, yycolumn, yytext()); }
{IF} {return new Symbol(sym.IF, yyline, yycolumn, yytext()); }
{ELSE} {return new Symbol(sym.ELSE, yyline, yycolumn, yytext()); }
{ELSEIF} {return new Symbol(sym.ELSEIF, yyline, yycolumn, yytext()); }

{IGUAL} {return new Symbol(sym.IGUAL, yyline, yycolumn, yytext()); }
{SWITCH} {return new Symbol(sym.SWITCH, yyline, yycolumn, yytext()); }
{CASE} {return new Symbol(sym.CASE, yyline, yycolumn, yytext()); }
{BREAK} {return new Symbol(sym.BREAK, yyline, yycolumn, yytext()); }
{DEFAULT} {return new Symbol(sym.DEFAULT, yyline, yycolumn, yytext()); }
{DOSPTOS} {return new Symbol(sym.DOSPTOS, yyline, yycolumn, yytext()); }
{FOR} {return new Symbol(sym.FOR, yyline, yycolumn, yytext()); }
{INCREMENTO} {return new Symbol(sym.INCREMENTO, yyline, yycolumn, yytext()); }
{PTOCOMA} {return new Symbol (sym.PTOCOMA,yyline,yycolumn, yytext());}
{PARENTESIS_CIERRE} {return new Symbol(sym.PARENTESIS_CIERRE, yyline, yycolumn, yytext()); }
{WHILE} {return new Symbol(sym.WHILE, yyline, yycolumn, yytext()); }
{DEFINIR_GLOBALES} {return new Symbol(sym.DEFINIR_GLOBALES, yyline, yycolumn, yytext()); }
{GRAFICABARRAS} {return new Symbol(sym.GRAFICABARRAS, yyline, yycolumn, yytext()); }
{NEWVALOR} {return new Symbol(sym.NEWVALOR, yyline, yycolumn, yytext()); }
{DOLAR} {return new Symbol(sym.DOLAR, yyline, yycolumn, yytext()); }
{COMA} {return new Symbol(sym.COMA, yyline, yycolumn, yytext()); }
{ARREGLO} {return new Symbol(sym.ARREGLO, yyline, yycolumn, yytext()); }
{TITULO} {return new Symbol(sym.TITULO, yyline, yycolumn, yytext()); }
{EJEX} {return new Symbol(sym.EJEX, yyline, yycolumn, yytext()); }
{VALORES} {return new Symbol(sym.VALORES, yyline, yycolumn, yytext()); }
{TITULOEJEX} {return new Symbol(sym.TITULOEJEX, yyline, yycolumn, yytext()); }
{TITULOEJEY} {return new Symbol(sym.TITULOEJEY, yyline, yycolumn, yytext()); }
{GRAFICAPIE}  {return new Symbol(sym.GRAFICAPIE, yyline, yycolumn, yytext()); }

//{CARACTER} {return new Symbol(sym.CARACTER, yyline, yycolumn, yytext()); }


{CONCAT} {return new Symbol(sym.CONCAT, yyline, yycolumn, yytext()); }






{DO} {return new Symbol(sym.DO, yyline, yycolumn, yytext()); }

{T_F} {return new Symbol (sym.T_F,yyline,yycolumn, yytext());}
{VARIABLE} {return new Symbol (sym.VARIABLE,yyline,yycolumn, yytext());}
{ENTERO} {return new Symbol (sym.ENTERO,yyline,yycolumn, yytext());}
{DECIMAL} {return new Symbol (sym.DECIMAL,yyline,yycolumn, yytext());}

{CADENA} {return new Symbol(sym.CADENA, yyline, yycolumn, yytext()); }

[ \t\r\n\f]     {/* Espacios en blanco se ignoran */}
{COMENTARIOLINEA}   {/*System.out.println("Comentario: "+yytext());*/ }
{COMENTARIOMULTI}   { /*System.out.println("Comentario: multilinea"+yytext());*/ }

.           	{ System.out.println("Error Lexico: " + yytext() + " | Fila:" + yyline + " | Columna: " + yycolumn); }