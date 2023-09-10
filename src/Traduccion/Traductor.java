package Traduccion;

import java.io.StringReader;
import java.util.HashMap;
import java.util.LinkedList;

public class Traductor {
    public static HashMap variables = new HashMap();//Tabla de Simbolos para variables
    public static int contador = 0; //Contador de tabulaciones
    public static LinkedList<String> traduccion = new LinkedList<>();//Lista de traduccion

    public static  String texto;
    // Agregar Tabulaciones
    public static LinkedList<String>  tabulaciones(LinkedList<String> lista){
        String tabs = "";
        for (int i = 0; i < contador; i++) {
            tabs = "\t"+tabs;
        }

        for (int i = 0; i < lista.size(); i++) {
            lista.set(i, tabs+lista.get(i));
        }

        return lista;
    }
    public static String cambiar(String cadena){
        cadena = cadena.replace("+",",");
        return  cadena;
    }


    public static void analizarStatpy (String entrada){
        try {
            Statpy.Lexer lexer = new Statpy.Lexer(new StringReader(entrada));
            Statpy.Parser parser = new Statpy.Parser(lexer);
            parser.parse();
        } catch (Exception e) {
            System.out.println("Error fatal en compilación de entrada.");
            System.out.println(e);
        }
    }

    public static String retornarTraduccion(){
        texto = "";
        traduccion.forEach((valor) -> {
           texto += valor + "\n";
        });
        return  texto;
    }





}

