package Tokens;

import java.util.LinkedList;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.LinkedList;
public class Errores {

    public String lexema;
    public String token;

    public int linea;
    public int columna;

    public static LinkedList<Errores> errores = new LinkedList<Errores>();
    public Errores(String lexema, String token, int linea, int columna){
        this.lexema = lexema;
        this.token = token;
        this.linea = linea;
        this.columna = columna;
    }

    public static void generarHTML() {
        try {
            BufferedWriter writer = new BufferedWriter(new FileWriter("errores.html"));

            // Escribir la estructura básica del HTML
            writer.write("<html><head><title>Lista de Errores</title></head><body>");

            // Crear la tabla HTML
            writer.write("<table border='1'>");
            writer.write("<tr><th>Lexema</th><th>Token</th><th>Línea</th><th>Columna</th></tr>");

            // Agregar filas de la tabla basadas en la lista de errores
            for (Errores error : errores) {
                writer.write("<tr>");
                writer.write("<td>" + error.lexema + "</td>");
                writer.write("<td>" + error.token + "</td>");
                writer.write("<td>" + error.linea + "</td>");
                writer.write("<td>" + error.columna + "</td>");
                writer.write("</tr>");
            }

            // Cerrar la tabla y el HTML
            writer.write("</table></body></html>");
            writer.close();

            System.out.println("Archivo HTML generado correctamente.");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

