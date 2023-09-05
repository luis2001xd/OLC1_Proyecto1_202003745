package Menú;

import java.io.StringReader;

public class Principal {
    public static void main(String[] args) {
        //analizadores("src/Analizadores/", "Lexer.jflex", "Parser.cup");
        String codigo_2 = Lectura.Leer.LeerArchivo("/home/cluiis/IdeaProjects/OLC1_Proyecto1_202003745/Pruebas/Prueba.sp");
        String codigo =
                "void main ( ){" +
                "int x = 1;\n" +
                "do{\n" +
                "Console.Write(a);" +
                "}\n" +
                "while (a > 10);\n" +
                "}\n"
        ;


        analizar(codigo_2);

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
