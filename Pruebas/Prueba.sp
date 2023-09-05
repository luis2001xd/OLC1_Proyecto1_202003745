// Salio compi 1 XD&&&&$$$$$
/* INVESTIGACION DE OPERACIONES
2 ES EL PEOR
CURSO */

void main(){
    int x = 9;
    int y = 12 * 8 + 9.5 + 8.5 - 10 + 18 / 2;
    int precio = 0;
    double z = 19.5;
    bool flag1 = TRUE;
    bool flag2 = 9 >= 5;
    string cadena = "Hola mundo, esto es una prueba ###";
    string cadena_2 = cadena + "Esto es la continuación de hola mundo";
    char caracter_1 = 'h';
    Console.Write("Este es el proyecto 1 de compiladores" + cadena + cadena_2);
    Console.Write(y + x);
    Console.Write("&&11/()))))");
    for (int i = 0; i <= 10; i++){
        if (i == 10){
            Console.Write(i);
            int a = i;
        } else if (i > 5){
            Console.Write("i es mayor que 5"); // Cambiado a mayúscula
            int b = a; // Variable 'a' definida dentro del bloque 'if', por lo que no es accesible en el bloque 'else if'
            while (b <= i){
                Console.Write("i es mayor o igual que b");
                Console.Write("Esto es un ciclo while");
                char v = 'j';
            }
        } else {
            Console.Write("Esto es un else");
        }
    } // Cierre de llave para el bucle 'for'

    void DefinirGlobales(){
    		string reporte1 = "Reporte 1";
    		double pe1 = 0.8;
    		double pe2 = 0.5;
    		double pe3 = 0.2;
    		double po1 = ${ NewValor, "archivo2.json", "valor1"};
    		double po2 = ${ NewValor, "archivo1.json", "valor1"};
    		string vart = "Valor Obtenido";
    		string var2 = "Valor Esperado clase 1";
    		string var22 = "Valor Obtenido clase 1";
    		string var3 = "Valore Esperado clase 2";
    		string var3 = "Valor Obtenido clase 2";
    	}

    switch (x){
        case 1:
            precio = 12;
            break; //HOLA
        case 2:
            precio = 567;

        default:
            if (precio == 12 || precio == 567){
                Console.Write("Si funciona el switch");
            } else {
                Console.Write("Leyó el else también");
            }
            break;//Salir del default
    }

    int a = 1;
    do {
        Console.Write("el valor de a es: " + a);
    } while(a < 16);

    if ( a > 45 && b < 10 && !bool2){
        Console.Write("Si sale compi 1 :))))"); // Animo si sale todavía
    }
}
