package Graficas;
import Json.Variables_Json;
import  Json.Variables_Json.*;
import java.util.LinkedList;
public class Variables {
    public static LinkedList<Variables_Json> variablesJsons = new LinkedList<>();
    public static LinkedList<Globales> variablesGlobales = new LinkedList<>();


    public  static void mostrarJson(){
        Graficas.Variables.variablesJsons.forEach((valor) -> {
            System.out.println("Nombre del documento:"+valor.documento);
            System.out.println("Nombre de la variable "+valor.variable);
            System.out.println("Valor de la variable "+valor.valor);
        });

    }

    public static String eliminarComillas(String cadena) {
        if (cadena.startsWith("\"") && cadena.endsWith("\"")) {
            return cadena.substring(1, cadena.length() - 1);
        } else if (cadena.startsWith("'") && cadena.endsWith("'")) {
            return cadena.substring(1, cadena.length() - 1);
        } else {
            return cadena;
        }
    }

    public static void mostrarGlobales(){

        Variables.variablesGlobales.forEach((valor) -> {
            System.out.println("Nombre de la variable:"+ valor.nombre);
            System.out.println("Valor de la variable:"+valor.valor);
        });
    }




}


