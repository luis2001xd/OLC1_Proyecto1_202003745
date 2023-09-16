package Graficas;

import java.util.LinkedList;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartFrame;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.data.general.DefaultPieDataset;
import javax.imageio.ImageIO;
import java.io.File;
public class Graficar {

    public static String titulo = "";

    public static LinkedList <String> ejex = new LinkedList<String>();
    public static LinkedList<Double> valores = new LinkedList<Double>();

    public static String TituloEjex = "";

    public static String TituloEjey = "";

    public static  String tipo = "";

    public static  int contador = 0;

    public  static  String nombreArchivo = "Grafica";

    public static void identificar() {

        if (tipo.equals("Barras")){
            GraficaBarras();
        } else if (tipo.equals("Pie")) {
            GraficaPie();
        }
        valores.clear();
        ejex.clear();
    }

    public static void GraficaBarras(){
        int size = valores.size();
        DefaultCategoryDataset dataset = new DefaultCategoryDataset();
        for (int i = 0; i < size ; i++){
            dataset.addValue(valores.get(i), "Valor", ejex.get(i));
        }

        JFreeChart grafica =
                ChartFactory.createBarChart(
                        titulo, //TITULO
                        TituloEjex, TituloEjey,
                        dataset,
                        PlotOrientation.VERTICAL,
                        true, true, true);


        // Mostrar
        ChartFrame frame = new ChartFrame("Gráfica Barras", grafica);
        frame.pack();
        frame.setVisible(true);

        // Guardar la gráfica como imagen
        try {
            ImageIO.write(grafica.createBufferedImage(800, 600), "png", new File(nombreArchivo + contador + ".png"));
            contador++;
        } catch (Exception e) {
            e.printStackTrace();
        }
        //frame.pack();
        //frame.setVisible(true);

    }


    public static  void GraficaPie(){
        DefaultPieDataset dataset = new DefaultPieDataset( );
        int size = valores.size();
        for(int i = 0; i < size; i++){
            dataset.setValue(ejex.get(i), valores.get(i));
        }
        // Creación de gráfica
        JFreeChart grafica =
                ChartFactory.createPieChart(titulo, dataset);


        // Mostrar


        // Mostrar
        ChartFrame frame = new ChartFrame("Grafica Pie", grafica);
        frame.pack();
        frame.setVisible(true);

        // Guardar la gráfica como imagen
        try {
            ImageIO.write(grafica.createBufferedImage(800, 600), "png", new File(nombreArchivo + contador + ".png"));
            contador++;
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
