package Menú;
import javax.swing.*;
import javax.swing.border.Border;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import Graficas.Globales;
import Graficas.Variables;
import Json.Parser;
import Lectura.Leer;
import Tokens.Errores;
import Tokens.Tabla;
import jdk.nashorn.internal.parser.Token;

import java.io.*;
import java.io.File;
import java.io.IOException;import java.awt.Desktop;

public class Ventana extends JFrame{
    Border border = BorderFactory.createMatteBorder(3,3,3,3, Color.LIGHT_GRAY);

    private JPanel panel;
    private JTable tbLecturas;
    private JLabel etiqueta1, etiqueta2, etiqueta3;
    private JButton botonAbrir,botonGuardar,botonGuardarComo,botonAnalizar, reporteTokens, errores;

    private JTextField textfield1;
    private JTextArea textarea1, textarea2;
    private JScrollPane scrollpane1, scrollpane2;
    private JFileChooser arch;

    private File archivo;
    public String nombreArchivo, nombreArchivo2;

    private JComboBox Traductor;

    public Ventana(){
        this.setSize(1500,1000);
        paneles();
        this.setVisible(true);
        this.setLocationRelativeTo(null);

        this.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
    }

    public void paneles(){
        this.panel = new JPanel();
        this.panel.setBackground(Color.white);

        this.panel.setLayout(null);
        this.getContentPane().add(panel);
        etiquetas();
        botones();
        areaTexto();


    }

    private void etiquetas(){
        this.etiqueta1 = new JLabel();
        this.etiqueta1.setBounds(60,40,200,310);
        this.etiqueta1.setVerticalAlignment(JLabel.TOP);
        this.etiqueta1.setHorizontalAlignment(JLabel.CENTER);

        this.etiqueta1.setText("Archivo");
        this.etiqueta1.setBorder(border);
        this.etiqueta1.setFont(new Font("Gadugi",Font.BOLD,15));
        this.panel.add(etiqueta1);

        this.etiqueta2 = new JLabel();
        this.etiqueta2.setBounds(400,22,130,30);
        this.etiqueta2.setVerticalAlignment(JLabel.TOP);
        this.etiqueta2.setHorizontalAlignment(JLabel.CENTER);

        this.etiqueta2.setText("Archivo a leer");
        this.etiqueta2.setBorder(border);
        this.etiqueta2.setFont(new Font("Gadugi",Font.BOLD,15));
        this.panel.add(etiqueta2);

        this.etiqueta3 = new JLabel();
        this.etiqueta3.setBounds(230,450,130,30);
        this.etiqueta3.setVerticalAlignment(JLabel.TOP);
        this.etiqueta3.setHorizontalAlignment(JLabel.CENTER);

        this.etiqueta3.setText("Salida");
        this.etiqueta3.setBorder(border);
        this.etiqueta3.setFont(new Font("Gadugi",Font.BOLD,15));
        this.panel.add(etiqueta3);



    }

    private  void botones(){
        this.botonAbrir = new JButton("Abrir archivo");
        this.botonAbrir.setBounds(85,80,150,40);
        this.botonAbrir.setBorder(border);
        this.botonAbrir.setBackground(new Color(214, 219, 223));
        //this.botonAbrir.setFont(new Font("Georgia",Font.PLAIN,18));
        this.botonAbrir.setFont(new Font("Gadugi",Font.BOLD,14));
        this.panel.add(botonAbrir);

        ActionListener abrir = new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                try{
                    arch = new JFileChooser();
                    arch.showOpenDialog(null);
                    archivo = arch.getSelectedFile();
                    nombreArchivo = archivo.toString();
                    nombreArchivo2 = arch.getSelectedFile().getName();

                    textarea1.setText(Leer.LeerArchivo(archivo.toString()));
                } catch (Exception r){
                    System.out.println("hola");
                }
            }
        };

        botonAbrir.addActionListener(abrir);


        this.botonGuardar = new JButton("Guardar archivo");
        this.botonGuardar.setBounds(85,144,150,40);
        this.botonGuardar.setBorder(border);
        this.botonGuardar.setBackground(new Color(214, 219, 223));
        this.botonGuardar.setFont(new Font("Gadugi",Font.BOLD,14));
        this.panel.add(botonGuardar);


        ActionListener guardar = new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {

                Leer.CrearArchivo(textarea1.getText(),nombreArchivo);

                JOptionPane.showMessageDialog(null,"El archivo se guardo con éxito");
            }
        };

        botonGuardar.addActionListener(guardar);




        this.botonGuardarComo = new JButton("Guardar como");
        this.botonGuardarComo.setBounds(85,208,150,40);
        this.botonGuardarComo.setBackground(new Color(214, 219, 223));
        this.botonGuardarComo.setFont(new Font("Gadugi",Font.BOLD,14));
        this.panel.add(botonGuardarComo);

        ActionListener guardarComo = new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                arch = new JFileChooser();
                arch.showSaveDialog(botonGuardarComo);
                nombreArchivo2 = arch.getSelectedFile().getName();

                Leer.CrearArchivo(textarea1.getText(),arch.getSelectedFile().toString());
                JOptionPane.showMessageDialog(null,"El archivo se guardo con éxito");
            }
        };

        botonGuardarComo.addActionListener(guardarComo);




        String [] roles = {"StatPy","Json"};
        Traductor= new JComboBox(roles);
        Traductor.setBounds(85,272,150,40);
        Traductor.setBorder(border);
        panel.add(Traductor);

        this.botonAnalizar = new JButton("Ejecutar");
        this.botonAnalizar.setBounds(550,360,180,40);
        this.botonAnalizar.setBackground(new Color(214, 219, 223));
        this.botonAnalizar.setFont(new Font("Gadugi",Font.BOLD,14));
        this.panel.add(botonAnalizar);

        ActionListener Analizar = new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {


                String seleccion = (String) Traductor.getSelectedItem();
                if (seleccion != null) {
                    if (seleccion.equals("StatPy")) {
                        analizarStatpy();
                        textarea2.setText(Traduccion.Traductor.retornarTraduccion());
                        textarea2.setEditable(false);
                        //Graficas.Variables.mostrarGlobales();
                        Tokens.Tabla.generarHTML();
                        Tokens.Errores.generarHTML();
                        Traduccion.Traductor.traduccion.clear();
                        Tabla.tokens.clear();
                        Errores.errores.clear();


                    } else if (seleccion.equals("Json")) {
                        System.out.println("Seleccionaste Json");
                        textarea2.setText("hola soy el json");
                        Json.Parser.nombreDocumento = nombreArchivo2;
                        analizarJson();
                        Tokens.Tabla.generarHTML();
                        Tokens.Errores.generarHTML();
                        Tabla.tokens.clear();
                        Errores.errores.clear();


                        textarea2.setEditable(false);

                    }
                }


            }

        };
        this.botonAnalizar.addActionListener(Analizar);


        this.reporteTokens = new JButton("Reporte tokens");
        this.reporteTokens.setBounds(20,480,180,40);
        this.reporteTokens.setBackground(new Color(214, 219, 223));
        this.reporteTokens.setFont(new Font("Gadugi",Font.BOLD,14));
        this.panel.add(reporteTokens);

        ActionListener Reptok = new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {

                try {
                    File htmlFile = new File("tokens.html");

                    if (htmlFile.exists() && Desktop.isDesktopSupported()) {
                        Desktop.getDesktop().browse(htmlFile.toURI());
                    } else {
                        System.out.println("El archivo tokens.html no existe o no se puede abrir.");
                    }
                } catch (IOException ex) {
                    ex.printStackTrace();
                }
            }

        };

        this.reporteTokens.addActionListener(Reptok);



        this.errores = new JButton("Errores léxicos");
        this.errores.setBounds(20,600,180,40);
        this.errores.setBackground(new Color(214, 219, 223));
        this.errores.setFont(new Font("Gadugi",Font.BOLD,14));
        this.panel.add(errores);

        ActionListener error = new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {

                try {
                    File htmlFile = new File("errores.html");

                    if (htmlFile.exists() && Desktop.isDesktopSupported()) {
                        Desktop.getDesktop().browse(htmlFile.toURI());
                    } else {
                        System.out.println("El archivo errores.html no existe o no se puede abrir.");
                    }
                } catch (IOException ex) {
                    ex.printStackTrace();
                }
            }

        };

        this.errores.addActionListener(error);

    }

    private void areaTexto(){
        this.textarea1 = new JTextArea();

        this.textarea1.setBorder(border);
        textarea1.setTabSize(4);
        this.scrollpane1 = new JScrollPane(textarea1);
        this.scrollpane1.setBounds(400,50,500,300);
        this.panel.add(scrollpane1);

        this.textarea2 = new JTextArea();

        this.textarea2.setBorder(border);
        textarea2.setTabSize(4);
        this.scrollpane2 = new JScrollPane(textarea2);
        this.scrollpane2.setBounds(230,480,600,200);
        this.panel.add(scrollpane2);

    }

    public void analizarJson(){
        try {
            Json.Lexer lexer = new Json.Lexer(new StringReader(textarea1.getText()));
            Json.Parser parser = new Json.Parser(lexer);
            parser.parse();
        } catch (Exception e) {
            System.out.println("Error fatal en compilación de entrada.");
            System.out.println(e);
        }
    }

    public void analizarStatpy(){
        try {
            Statpy.Lexer lexer = new Statpy.Lexer(new StringReader(textarea1.getText()));
            Statpy.Parser parser = new Statpy.Parser(lexer);
            parser.parse();
        } catch (Exception e) {
            System.out.println("Error fatal en compilación de entrada.");
            System.out.println(e);
        }
    }

}