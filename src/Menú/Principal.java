package Menú;

import java.io.StringReader;

public class Principal {
    public static void main(String[] args) {

        //analizadores("src/Analizadores/", "Lexer.jflex", "Parser.cup");

        String codigo = "void " +
                " main(){" +
                "int x = 9;" +
                "double r = 12.5;" +
                "string luis = \"Hola mundo, ahí andamos\"+\"Hola mundo, ahí andamosx3\";" +
                "bool verdad = trUE;" +
                "bool false = !x;" +
                "Console.Write(hola);" +
                "if ( a > b){" +
                "int a = 5;" +
                "int l = 122;" +
                "int y = 112;" +
                "}else if (x > 9){" +
                "int p = 123;" +
                "}else if (h>12){" +
                "int w = 2323;" +
                "}" +
                "Console.Write(holsx3);";
        ;

        System.out.println(codigo);
        analizar(codigo);

         //new Ventana();
    }





    public static  void mostrar(String texto){
        System.out.println(texto+"ks");
    }
    public static void analizadores(String ruta, String jflexFile, String cupFile){
        try {
            String opcionesJflex[] =  {ruta+jflexFile,"-d",ruta};
            jflex.Main.generate(opcionesJflex);

            String opcionesCup[] =  {"-destdir", ruta,"-parser","Parser",ruta+cupFile};
            java_cup.Main.main(opcionesCup);

        } catch (Exception e) {
            System.out.println("No se ha podido generar los analizadores");
            System.out.println(e);

        }
    }



    public static void analizar (String entrada){
        try {
            Analizadores.Lexer lexer = new Analizadores.Lexer(new StringReader(entrada));
            Analizadores.Parser parser = new Analizadores.Parser(lexer);
            parser.parse();
        } catch (Exception e) {
            System.out.println("Error fatal en compilación de entrada.");
            System.out.println(e);
        }
    }


    
    // Realizar Analisis

}
