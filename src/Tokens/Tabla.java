package Tokens;

import java.io.FileWriter;
import java.io.IOException;
import java.util.LinkedList;

public class Tabla {

    public static LinkedList<AtributosToken> tokens = new LinkedList<AtributosToken>();

    public static void generarHTML() {
        try {
            FileWriter htmlFile = new FileWriter("tokens.html");
            htmlFile.write("<html>\n<head>\n<title>Lista de Tokens</title>\n</head>\n<body>\n");
            htmlFile.write("<table border=\"1\">\n");
            htmlFile.write("<tr><th>Lexema</th><th>Token</th><th>Línea</th><th>Columna</th></tr>\n");

            for (AtributosToken token : tokens) {
                htmlFile.write("<tr>");
                htmlFile.write("<td>" + token.lexema + "</td>");
                htmlFile.write("<td>" + token.token + "</td>");
                htmlFile.write("<td>" + token.linea + "</td>");
                htmlFile.write("<td>" + token.columna + "</td>");
                htmlFile.write("</tr>\n");
            }

            htmlFile.write("</table>\n");
            htmlFile.write("</body>\n</html>");
            htmlFile.close();
            System.out.println("Archivo HTML generado correctamente: tokens.html");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

