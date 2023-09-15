package Menu;

import java.io.StringReader;

public class Principal {
    public static void main(String[] args) {
        //analizadores("src/Statpy/", "Lexer.jflex", "Parser.cup");
        //analizadores("src/Json/", "Lexer.jflex", "Parser.cup");
        //String codigo_2 = Lectura.Leer.LeerArchivo("/home/cluiis/IdeaProjects/OLC1_Proyecto1_202003745/Pruebas/Prueba.sp");
        String codigo =
                "void main ( ){" +
                        "for (int x = 5; x > 21; x++){" +
                        "console.write(holaaaa);" +
                        "int v = -1212;" +
                        "if (x > 10){" +
                        "int ty = 2001;//hola\n" +
                        "}" +
                        "}" +
                        "console.write(h);" +
                        "console.write(dd);" +
                        "console.write(aqwqw);" +
                        "while (f < 10){" +
                        "console.write(xd);" +
                        "}" +
                        "int p = 0;" +
                        "do{" +
                        "console.write(x);" +
                        "}while(p > 1123);" +
                        "int f = 567;"+
                        "} "
        ;


        //String json = Lectura.Leer.LeerArchivo("/home/cluiis/IdeaProjects/OLC1_Proyecto1_202003745/Pruebas/archivo.json");

        //analizar(json);
        new Ventana();
        //Double x = 12.0;
        //System.out.println(x);
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
            Json.Lexer lexer = new Json.Lexer(new StringReader(entrada));
            Json.Parser parser = new Json.Parser(lexer);
            parser.parse();
        } catch (Exception e) {
            System.out.println("Error fatal en compilación de entrada.");
            System.out.println(e);
        }
    }






    
    // Realizar Analisis

}
