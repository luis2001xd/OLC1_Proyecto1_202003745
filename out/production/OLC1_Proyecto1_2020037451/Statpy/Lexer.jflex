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



{MAIN} {
Tokens.AtributosToken token = new Tokens.AtributosToken(yytext(),"MAIN",yycolumn, yyline);
Tokens.Tabla.tokens.add(token);
return new Symbol (sym.MAIN,yyline,yycolumn, yytext());}

{LLAVE_ABERTURA} {
Tokens.AtributosToken token = new Tokens.AtributosToken(yytext(), "LLAVE_ABERTURA", yyline, yycolumn);
Tokens.Tabla.tokens.add(token);
return new Symbol(sym.LLAVE_ABERTURA, yyline, yycolumn, yytext()); }


{VOID} {
Tokens.AtributosToken token = new Tokens.AtributosToken(yytext(), "VOID", yyline, yycolumn);
Tokens.Tabla.tokens.add(token);
return new Symbol (sym.VOID,yyline,yycolumn, yytext());
}


{PRINT}  {
Tokens.AtributosToken token = new Tokens.AtributosToken(yytext(), "PRINT", yyline, yycolumn);
Tokens.Tabla.tokens.add(token);
return new Symbol(sym.PRINT, yyline, yycolumn,yytext());  }


{PARENTESIS_ABERTURA} {
Tokens.AtributosToken token = new Tokens.AtributosToken(yytext(), "PARENTESIS_ABERTURA", yyline, yycolumn);
Tokens.Tabla.tokens.add(token);
return new Symbol(sym.PARENTESIS_ABERTURA, yyline, yycolumn, yytext()); }

//{COMILLA} {return new Symbol(sym.COMILLA, yyline, yycolumn, yytext()); }

{LLAVE_CIERRE } {
Tokens.AtributosToken token = new Tokens.AtributosToken(yytext(), "LLAVE_CIERRE", yyline, yycolumn);
Tokens.Tabla.tokens.add(token);
return new Symbol(sym.LLAVE_CIERRE, yyline, yycolumn, yytext()); }


{MAYOR_QUE} {
Tokens.AtributosToken token = new Tokens.AtributosToken(yytext(), "MAYOR_QUE", yyline, yycolumn);
Tokens.Tabla.tokens.add(token);
return new Symbol(sym.MAYOR_QUE, yyline, yycolumn, yytext()); }


{MENOR_QUE} {
Tokens.AtributosToken token = new Tokens.AtributosToken(yytext(), "MENOR_QUE", yyline, yycolumn);
Tokens.Tabla.tokens.add(token);
return new Symbol(sym.MENOR_QUE, yyline, yycolumn, yytext()); }


{SUMA} {
Tokens.AtributosToken token = new Tokens.AtributosToken(yytext(), "SUMA", yyline, yycolumn);
Tokens.Tabla.tokens.add(token);
return new Symbol(sym.SUMA, yyline, yycolumn, yytext()); }

{MENOS} {
Tokens.AtributosToken token = new Tokens.AtributosToken(yytext(), "MENOS", yyline, yycolumn);
Tokens.Tabla.tokens.add(token);
return new Symbol(sym.MENOS, yyline, yycolumn, yytext()); }

{MULT} {
Tokens.AtributosToken token = new Tokens.AtributosToken(yytext(), "MULT", yyline, yycolumn);
Tokens.Tabla.tokens.add(token);
return new Symbol(sym.MULT, yyline, yycolumn, yytext()); }

{DIVISION} {
Tokens.AtributosToken token = new Tokens.AtributosToken(yytext(), "DIVISION", yyline, yycolumn);
Tokens.Tabla.tokens.add(token);
return new Symbol(sym.DIVISION, yyline, yycolumn, yytext()); }

{MAYOR_IGUAL} {
Tokens.AtributosToken token = new Tokens.AtributosToken(yytext(), "MAYOR_IGUAL", yyline, yycolumn);
Tokens.Tabla.tokens.add(token);
return new Symbol(sym.MAYOR_IGUAL, yyline, yycolumn, yytext()); }

{MENOR_IGUAL} {
Tokens.AtributosToken token = new Tokens.AtributosToken(yytext(), "MENOR_IGUAL", yyline, yycolumn);
Tokens.Tabla.tokens.add(token);
return new Symbol(sym.MENOR_IGUAL, yyline, yycolumn, yytext()); }

{DOBLE_IGUAL} {
Tokens.AtributosToken token = new Tokens.AtributosToken(yytext(), "DOBLE_IGUAL", yyline, yycolumn);
Tokens.Tabla.tokens.add(token);
return new Symbol(sym.DOBLE_IGUAL, yyline, yycolumn, yytext()); }

{DISTINTO} {
Tokens.AtributosToken token = new Tokens.AtributosToken(yytext(), "DISTINTO", yyline, yycolumn);
Tokens.Tabla.tokens.add(token);
return new Symbol(sym.DISTINTO, yyline, yycolumn, yytext()); }

{AND} {
Tokens.AtributosToken token = new Tokens.AtributosToken(yytext(), "AND", yyline, yycolumn);
Tokens.Tabla.tokens.add(token);
return new Symbol(sym.AND, yyline, yycolumn, yytext()); }

{OR} {
Tokens.AtributosToken token = new Tokens.AtributosToken(yytext(), "OR", yyline, yycolumn);
Tokens.Tabla.tokens.add(token);
return new Symbol(sym.OR, yyline, yycolumn, yytext()); }

{NOT} {
Tokens.AtributosToken token = new Tokens.AtributosToken(yytext(), "NOT", yyline, yycolumn);
Tokens.Tabla.tokens.add(token);
return new Symbol(sym.NOT, yyline, yycolumn, yytext()); }

{INT} {
Tokens.AtributosToken token = new Tokens.AtributosToken(yytext(), "INT", yyline, yycolumn);
Tokens.Tabla.tokens.add(token);
return new Symbol(sym.INT, yyline, yycolumn, yytext()); }

{DOUBLE} {
Tokens.AtributosToken token = new Tokens.AtributosToken(yytext(), "DOUBLE", yyline, yycolumn);
Tokens.Tabla.tokens.add(token);
return new Symbol(sym.DOUBLE, yyline, yycolumn, yytext()); }

{CHAR} {
Tokens.AtributosToken token = new Tokens.AtributosToken(yytext(), "CHAR", yyline, yycolumn);
Tokens.Tabla.tokens.add(token);
return new Symbol(sym.CHAR, yyline, yycolumn, yytext()); }

{BOOLEAN} {
Tokens.AtributosToken token = new Tokens.AtributosToken(yytext(), "BOOLEAN", yyline, yycolumn);
Tokens.Tabla.tokens.add(token);
return new Symbol(sym.BOOLEAN, yyline, yycolumn, yytext()); }

{STRING} {
Tokens.AtributosToken token = new Tokens.AtributosToken(yytext(), "STRING", yyline, yycolumn);
Tokens.Tabla.tokens.add(token);
return new Symbol(sym.STRING, yyline, yycolumn, yytext()); }

{IF} {
Tokens.AtributosToken token = new Tokens.AtributosToken(yytext(), "IF", yyline, yycolumn);
Tokens.Tabla.tokens.add(token);
return new Symbol(sym.IF, yyline, yycolumn, yytext()); }

{ELSE} {
Tokens.AtributosToken token = new Tokens.AtributosToken(yytext(), "ELSE", yyline, yycolumn);
Tokens.Tabla.tokens.add(token);
return new Symbol(sym.ELSE, yyline, yycolumn, yytext()); }

{ELSEIF} {
Tokens.AtributosToken token = new Tokens.AtributosToken(yytext(), "ELSEIF", yyline, yycolumn);
Tokens.Tabla.tokens.add(token);
return new Symbol(sym.ELSEIF, yyline, yycolumn, yytext()); }


{IGUAL} {
Tokens.AtributosToken token = new Tokens.AtributosToken(yytext(), "IGUAL", yyline, yycolumn);
Tokens.Tabla.tokens.add(token);
return new Symbol(sym.IGUAL, yyline, yycolumn, yytext()); }

{SWITCH} {
Tokens.AtributosToken token = new Tokens.AtributosToken(yytext(), "SWITCH", yyline, yycolumn);
Tokens.Tabla.tokens.add(token);
return new Symbol(sym.SWITCH, yyline, yycolumn, yytext()); }

{CASE} {
Tokens.AtributosToken token = new Tokens.AtributosToken(yytext(), "CASE", yyline, yycolumn);
Tokens.Tabla.tokens.add(token);
return new Symbol(sym.CASE, yyline, yycolumn, yytext()); }

{BREAK} {
Tokens.AtributosToken token = new Tokens.AtributosToken(yytext(), "BREAK", yyline, yycolumn);
Tokens.Tabla.tokens.add(token);
return new Symbol(sym.BREAK, yyline, yycolumn, yytext()); }

{DEFAULT} {
Tokens.AtributosToken token = new Tokens.AtributosToken(yytext(), "DEFAULT", yyline, yycolumn);
Tokens.Tabla.tokens.add(token);
return new Symbol(sym.DEFAULT, yyline, yycolumn, yytext()); }

{DOSPTOS} {
Tokens.AtributosToken token = new Tokens.AtributosToken(yytext(), "DOSPTOS", yyline, yycolumn);
Tokens.Tabla.tokens.add(token);
return new Symbol(sym.DOSPTOS, yyline, yycolumn, yytext()); }

{FOR} {
Tokens.AtributosToken token = new Tokens.AtributosToken(yytext(), "FOR", yyline, yycolumn);
Tokens.Tabla.tokens.add(token);
return new Symbol(sym.FOR, yyline, yycolumn, yytext()); }

{INCREMENTO} {
Tokens.AtributosToken token = new Tokens.AtributosToken(yytext(), "INCREMENTO", yyline, yycolumn);
Tokens.Tabla.tokens.add(token);
return new Symbol(sym.INCREMENTO, yyline, yycolumn, yytext()); }

{PTOCOMA} {
Tokens.AtributosToken token = new Tokens.AtributosToken(yytext(), "PTOCOMA", yyline, yycolumn);
Tokens.Tabla.tokens.add(token);
return new Symbol (sym.PTOCOMA,yyline,yycolumn, yytext());}

{PARENTESIS_CIERRE} {
Tokens.AtributosToken token = new Tokens.AtributosToken(yytext(), "PARENTESIS_CIERRE", yyline, yycolumn);
Tokens.Tabla.tokens.add(token);
return new Symbol(sym.PARENTESIS_CIERRE, yyline, yycolumn, yytext()); }

{WHILE} {
Tokens.AtributosToken token = new Tokens.AtributosToken(yytext(), "WHILE", yyline, yycolumn);
Tokens.Tabla.tokens.add(token);
return new Symbol(sym.WHILE, yyline, yycolumn, yytext()); }

{DEFINIR_GLOBALES} {
Tokens.AtributosToken token = new Tokens.AtributosToken(yytext(), "DEFINIR_GLOBALES", yyline, yycolumn);
Tokens.Tabla.tokens.add(token);
return new Symbol(sym.DEFINIR_GLOBALES, yyline, yycolumn, yytext()); }

{GRAFICABARRAS} {
Tokens.AtributosToken token = new Tokens.AtributosToken(yytext(), "GRAFICABARRAS", yyline, yycolumn);
Tokens.Tabla.tokens.add(token);
return new Symbol(sym.GRAFICABARRAS, yyline, yycolumn, yytext()); }

{NEWVALOR} {
Tokens.AtributosToken token = new Tokens.AtributosToken(yytext(), "NEWVALOR", yyline, yycolumn);
Tokens.Tabla.tokens.add(token);
return new Symbol(sym.NEWVALOR, yyline, yycolumn, yytext()); }

{DOLAR} {
Tokens.AtributosToken token = new Tokens.AtributosToken(yytext(), "DOLAR", yyline, yycolumn);
Tokens.Tabla.tokens.add(token);
return new Symbol(sym.DOLAR, yyline, yycolumn, yytext()); }

{COMA} {
Tokens.AtributosToken token = new Tokens.AtributosToken(yytext(), "COMA", yyline, yycolumn);
Tokens.Tabla.tokens.add(token);
return new Symbol(sym.COMA, yyline, yycolumn, yytext()); }

{ARREGLO} {
Tokens.AtributosToken token = new Tokens.AtributosToken(yytext(), "ARREGLO", yyline, yycolumn);
Tokens.Tabla.tokens.add(token);
return new Symbol(sym.ARREGLO, yyline, yycolumn, yytext()); }

{TITULO} {
Tokens.AtributosToken token = new Tokens.AtributosToken(yytext(), "TITULO", yyline, yycolumn);
Tokens.Tabla.tokens.add(token);
return new Symbol(sym.TITULO, yyline, yycolumn, yytext()); }

{EJEX} {
Tokens.AtributosToken token = new Tokens.AtributosToken(yytext(), "EJEX", yyline, yycolumn);
Tokens.Tabla.tokens.add(token);
return new Symbol(sym.EJEX, yyline, yycolumn, yytext()); }

{VALORES} {
Tokens.AtributosToken token = new Tokens.AtributosToken(yytext(), "VALORES", yyline, yycolumn);
Tokens.Tabla.tokens.add(token);
return new Symbol(sym.VALORES, yyline, yycolumn, yytext()); }

{TITULOEJEX} {
Tokens.AtributosToken token = new Tokens.AtributosToken(yytext(), "TITULOEJEX", yyline, yycolumn);
Tokens.Tabla.tokens.add(token);
return new Symbol(sym.TITULOEJEX, yyline, yycolumn, yytext()); }

{TITULOEJEY} {
Tokens.AtributosToken token = new Tokens.AtributosToken(yytext(), "TITULOEJEY", yyline, yycolumn);
Tokens.Tabla.tokens.add(token);
return new Symbol(sym.TITULOEJEY, yyline, yycolumn, yytext()); }

{GRAFICAPIE}  {
Tokens.AtributosToken token = new Tokens.AtributosToken(yytext(), "GRAFICAPIE", yyline, yycolumn);
Tokens.Tabla.tokens.add(token);
return new Symbol(sym.GRAFICAPIE, yyline, yycolumn, yytext()); }

//{CARACTER} {return new Symbol(sym.CARACTER, yyline, yycolumn, yytext()); }


{CONCAT} {return new Symbol(sym.CONCAT, yyline, yycolumn, yytext()); }






{DO} {
Tokens.AtributosToken token = new Tokens.AtributosToken(yytext(), "DO", yyline, yycolumn);
Tokens.Tabla.tokens.add(token);
return new Symbol(sym.DO, yyline, yycolumn, yytext()); }

{T_F} {
Tokens.AtributosToken token = new Tokens.AtributosToken(yytext(), "T_F", yyline, yycolumn);
Tokens.Tabla.tokens.add(token);
return new Symbol (sym.T_F,yyline,yycolumn, yytext());}

{VARIABLE} {
Tokens.AtributosToken token = new Tokens.AtributosToken(yytext(), "VARIABLE", yyline, yycolumn);
Tokens.Tabla.tokens.add(token);
return new Symbol (sym.VARIABLE,yyline,yycolumn, yytext());}

{ENTERO} {
Tokens.AtributosToken token = new Tokens.AtributosToken(yytext(), "ENTERO", yyline, yycolumn);
Tokens.Tabla.tokens.add(token);
return new Symbol (sym.ENTERO,yyline,yycolumn, yytext());}

{DECIMAL} {
Tokens.AtributosToken token = new Tokens.AtributosToken(yytext(), "DECIMAL", yyline, yycolumn);
Tokens.Tabla.tokens.add(token);
return new Symbol (sym.DECIMAL,yyline,yycolumn, yytext());}

{CADENA} {
Tokens.AtributosToken token = new Tokens.AtributosToken(yytext(), "CADENA", yyline, yycolumn);
Tokens.Tabla.tokens.add(token);
return new Symbol(sym.CADENA, yyline, yycolumn, yytext()); }

[ \t\r\n\f]     {/* Espacios en blanco se ignoran */}
{COMENTARIOLINEA}   {/*System.out.println("Comentario: "+yytext());*/ }
{COMENTARIOMULTI}   { /*System.out.println("Comentario: multilinea"+yytext());*/ }

.           	{
Tokens.Errores token = new Tokens.Errores(yytext(), "Error lexico", yyline, yycolumn);
Tokens.Errores.errores.add(token);
System.out.println("Error Lexico: " + yytext() + " | Fila:" + yyline + " | Columna: " + yycolumn); }