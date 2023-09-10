package Graficas;
import Json.Variables_Json;

import java.util.LinkedList;
public class Identificar {

    public static String titulo;

    public static LinkedList <String> ejex = new LinkedList<String>();
    public static LinkedList<Double> valores = new LinkedList<Double>();

    public static String TituloEjex;

    public static String TituloEjey;

    public static  String tipo;


    public void Graficar(String tipo){
        if (tipo.equals("Pie")){
            System.out.println("Es una gráfica pie");
        }
    }
}
