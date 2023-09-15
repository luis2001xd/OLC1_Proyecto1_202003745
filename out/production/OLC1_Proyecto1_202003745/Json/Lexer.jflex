package Json;
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
%ignorecase


//SIMBOLOS

LLAVE_ABERTURA = "{"
LLAVE_CIERRE = "}"
COMA = ","
CADENA = [\"'][^\"\n']*[\"']
DOSPTOS = ":"
DECIMAL = [0-9]+("."[  |0-9]+)?

CARACTER = [^\r\n]
ENTER   = \r|\n|\r\n
COMENTARIOLINEA = "//" {CARACTER}* {ENTER}?
COMENTARIOMULTI = "/*" [^/]~ "*/"

%%

{LLAVE_ABERTURA} {
Tokens.AtributosToken token = new Tokens.AtributosToken(yytext(), "LLAVE_ABERTURA", yyline, yycolumn);
Tokens.Tabla.tokens.add(token);
return new Symbol (sym.LLAVE_ABERTURA,yyline,yycolumn, yytext());}


{LLAVE_CIERRE} {
Tokens.AtributosToken token = new Tokens.AtributosToken(yytext(), "LLAVE_CIERRE", yyline, yycolumn);
Tokens.Tabla.tokens.add(token);
return new Symbol (sym.LLAVE_CIERRE,yyline,yycolumn, yytext());}

{COMA} {
Tokens.AtributosToken token = new Tokens.AtributosToken(yytext(), "COMA", yyline, yycolumn);
Tokens.Tabla.tokens.add(token);
return new Symbol (sym.COMA,yyline,yycolumn, yytext());}

{CADENA} {
Tokens.AtributosToken token = new Tokens.AtributosToken(yytext(), "CADENA", yyline, yycolumn);
Tokens.Tabla.tokens.add(token);
return new Symbol (sym.CADENA,yyline,yycolumn, yytext());}
{DOSPTOS} {
Tokens.AtributosToken token = new Tokens.AtributosToken(yytext(), "DOSPTOS", yyline, yycolumn);
Tokens.Tabla.tokens.add(token);
return new Symbol (sym.DOSPTOS,yyline,yycolumn, yytext());}
{DECIMAL} {
Tokens.AtributosToken token = new Tokens.AtributosToken(yytext(), "DECIMAL", yyline, yycolumn);
Tokens.Tabla.tokens.add(token);
return new Symbol (sym.DECIMAL,yyline,yycolumn, yytext());}

[ \t\r\n\f]     {/* Espacios en blanco se ignoran */}
{COMENTARIOLINEA}   {System.out.println("Comentario: "+yytext()); }
{COMENTARIOMULTI}   { System.out.println("Comentario: multilinea"+yytext()); }

.           	{
Tokens.Errores token = new Tokens.Errores(yytext(), "Error lexico", yyline, yycolumn);
Tokens.Errores.errores.add(token);
System.out.println("Error Lexico: " + yytext() + " | Fila:" + yyline + " | Columna: " + yycolumn); }