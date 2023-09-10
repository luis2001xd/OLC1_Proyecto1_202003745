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

{LLAVE_ABERTURA} {return new Symbol (sym.LLAVE_ABERTURA,yyline,yycolumn, yytext());}
{LLAVE_CIERRE} {return new Symbol (sym.LLAVE_CIERRE,yyline,yycolumn, yytext());}
{COMA} {return new Symbol (sym.COMA,yyline,yycolumn, yytext());}
{CADENA} {return new Symbol (sym.CADENA,yyline,yycolumn, yytext());}
{DOSPTOS} {return new Symbol (sym.DOSPTOS,yyline,yycolumn, yytext());}
{DECIMAL} {return new Symbol (sym.DECIMAL,yyline,yycolumn, yytext());}

[ \t\r\n\f]     {/* Espacios en blanco se ignoran */}
{COMENTARIOLINEA}   {System.out.println("Comentario: "+yytext()); }
{COMENTARIOMULTI}   { System.out.println("Comentario: multilinea"+yytext()); }

.           	{ System.out.println("Error Lexico: " + yytext() + " | Fila:" + yyline + " | Columna: " + yycolumn); }