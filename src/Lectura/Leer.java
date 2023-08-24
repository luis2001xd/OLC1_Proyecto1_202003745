package Lectura;
import java.io.*;
public class Leer {

    public static String texto;

    public static String LeerArchivo(String nombreArchivo){
        File archivo = new File(nombreArchivo);
        try {
            BufferedReader entrada = new BufferedReader(new FileReader(archivo));
            String lectura = entrada.readLine();
            texto = lectura+"\n";
            while (lectura != null){

                lectura = entrada.readLine();
                if (lectura == null){
                    break;
                }
                texto = texto + lectura+"\n";
            }
            entrada.close();
            System.out.println("termino el ciclo");
        } catch (Exception e){
            System.out.println("dddd");
        }
        System.out.println("Termino el ciclo");
        return  texto;
    }


    public static void CrearArchivo(String contenido, String nombreArchivo){
        try{
            FileWriter archivo = new FileWriter(nombreArchivo);
            PrintWriter  escritor = new PrintWriter(archivo);
            escritor.println(contenido);
            archivo.close();

        } catch (Exception e){
            System.out.println(e);
        }
    }


}
