package analizador;
import java_cup.runtime.Symbol;

%%
//<!([\ \n]|[\\s -~]+)+!>

%{
    //Código de usuario
%}

%class scanner  // definir como trabajara el scanner 
%cup            // trabajar con cup 
%public         // tipo publico
%line           // conteo de lineas - linea por linea
%char           // caracter por caracter
%unicode        // tipo de codigicacion para que acepte la  ñ u otro caracter
%ignorecase     // case insensitive 


//símbolos

LLAVE_ABERTURA = "{"
LLAVE_CIERRE = "}"
CONJUNTOS = "CONJ"
PORCENTAJE = "%%\n%%"
MONO = "~"
PUNTO = "."
DISYUNCIÓN = "|"
MÁS_VECES = "*"
MÁS = "+"
CERO = "?"
COMA = ","
DOBLE_PTO = ":"
PTOCOMA = ";"
COMILLA1 = "\""
COMILLA2 = "\""

//Ascii
ASCII32 = \s
ASCII35 = "#"
ASCII36 = "$"
ASCII37 = "%"
ASCII38 = "&"
ASCII40 = "("
ASCII41 = ")"
ASCII45 = "-"
ASCII47 = "/"
ASCII60 = "<"
ASCII61 = "="
ASCII62 = ">"
ASCII64 = "@"
ASCII91 = "["
ASCII92 = "\\"
ASCII93 = "]"
ASCII94 = "^"
ASCII95 = "_"
ASCII = ({ASCII32}|{ASCII35}|{ASCII36}|{ASCII37}|{ASCII38}|{ASCII40}|{ASCII41}|{ASCII45}|{ASCII47}|{ASCII59}|{ASCII60}|{ASCII61}|{ASCII62}|{ASCII64}|{ASCII91}|{ASCII92}|{ASCII93}|{ASCII94}|{ASCII95})*

// Expresiones regulares
FLECHA = [\s]*"-"[\s]*">"
ENTER   = \r|\n|\r\n
CARACTER = [^\r\n]
COMENTARIOLINEA = "//" {CARACTER}* {ENTER}?
COMENTARIOMULTI = "<!" [^/]~ "!>"
NOMBRE = ([A-Z a-z]|[0-9])*
DIGITO = [0-9]+
MAYUSC = [A-Z]+
MINUS = [a-z]+
SPACE   = [\ \r\t\f\t]

%%

<YYINITIAL> {LLAVE_ABERTURA}  {   return new Symbol(sym.LLAVE_ABERTURA, yyline, yycolumn,yytext());  }
<YYINITIAL> {LLAVE_CIERRE}  {   return new Symbol(sym.LLAVE_CIERRE, yyline, yycolumn,yytext());  }
<YYINITIAL> {CONJUNTOS}  {   return new Symbol(sym.CONJUNTOS, yyline, yycolumn,yytext());  }
<YYINITIAL> {NOMBRE}     {   return new Symbol(sym.NOMBRE, yyline, yycolumn,yytext());  }
<YYINITIAL> {DOBLE_PTO}     {   return new Symbol(sym.DOBLE_PTO, yyline, yycolumn,yytext());  }
<YYINITIAL> {NOMBRE}     {   return new Symbol(sym.NOMBRE, yyline, yycolumn,yytext());  }
<YYINITIAL> {FLECHA}     {   return new Symbol(sym.FLECHA, yyline, yycolumn,yytext());  }
<YYINITIAL> {MAYUSC}       {   return new Symbol(sym.MAYUSC, yyline, yycolumn,yytext());  }
<YYINITIAL> {MINUS}       {   return new Symbol(sym.MINUS, yyline, yycolumn,yytext());  }
<YYINITIAL> {DIGITO}       {   return new Symbol(sym.DIGITO, yyline, yycolumn,yytext());  }