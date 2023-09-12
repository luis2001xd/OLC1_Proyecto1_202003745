package Tokens;

public class AtributosToken {

    public String lexema;
    public String token;

    public int linea;
    public int columna;
    public AtributosToken(String lexema, String token, int linea, int columna){
        this.lexema = lexema;
        this.token = token;
        this.linea = linea;
        this.columna = columna;
    }
}
