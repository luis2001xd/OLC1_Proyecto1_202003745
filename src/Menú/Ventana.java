package Menú;
import javax.swing.*;
import javax.swing.border.Border;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import Lectura.Leer;
import java.io.*;

public class Ventana extends JFrame{
    Border border = BorderFactory.createMatteBorder(3,3,3,3, Color.LIGHT_GRAY);

    private JPanel panel;
    private JLabel etiqueta1, etiqueta2;
    private JButton botonAbrir,botonGuardar,botonGuardarComo,botonGenerar,botonAnalizar;
    private JTextArea txtArea;
    private JTextField textfield1;
    private JTextArea textarea1;
    private JScrollPane scrollpane1;
    private JFileChooser arch;

    private File archivo;
    private String nombreArchivo;


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
        this.etiqueta1.setBounds(60,50,200,240);
        this.etiqueta1.setVerticalAlignment(JLabel.TOP);
        this.etiqueta1.setHorizontalAlignment(JLabel.CENTER);

        this.etiqueta1.setText("Archivo");
        this.etiqueta1.setBorder(border);
        this.etiqueta1.setFont(new Font("Gadugi",Font.BOLD,15));
        this.panel.add(etiqueta1);

        this.etiqueta2 = new JLabel();
        this.etiqueta2.setBounds(60,330,130,30);
        this.etiqueta2.setVerticalAlignment(JLabel.TOP);
        this.etiqueta2.setHorizontalAlignment(JLabel.CENTER);

        this.etiqueta2.setText("Archivo a leer");
        this.etiqueta2.setBorder(border);
        this.etiqueta2.setFont(new Font("Gadugi",Font.BOLD,15));
        this.panel.add(etiqueta2);



    }

    private  void botones(){
        this.botonAbrir = new JButton("Abrir archivo");
        this.botonAbrir.setBounds(85,90,150,40);
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
                    textarea1.setText(Leer.LeerArchivo(archivo.toString()));
                } catch (Exception r){
                    System.out.println("hola");
                }
            }
        };

        botonAbrir.addActionListener(abrir);


        this.botonGuardar = new JButton("Guardar archivo");
        this.botonGuardar.setBounds(85,154,150,40);
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
        this.botonGuardarComo.setBounds(85,218,150,40);
        this.botonGuardarComo.setBackground(new Color(214, 219, 223));
        this.botonGuardarComo.setFont(new Font("Gadugi",Font.BOLD,14));
        this.panel.add(botonGuardarComo);

        ActionListener guardarComo = new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                arch.showSaveDialog(botonGuardarComo);

                Leer.CrearArchivo(textarea1.getText(),arch.getSelectedFile().toString());
                JOptionPane.showMessageDialog(null,"El archivo se guardo con éxito");
            }
        };

        botonGuardarComo.addActionListener(guardarComo);



        this.botonGenerar = new JButton("Generar automata");
        this.botonGenerar.setBounds(75,680,180,40);
        this.botonGenerar.setBackground(new Color(214, 219, 223));
        this.botonGenerar.setFont(new Font("Gadugi",Font.BOLD,14));
        this.panel.add(botonGenerar);

        this.botonAnalizar = new JButton("Analizar entrada");
        this.botonAnalizar.setBounds(300,680,180,40);
        this.botonAnalizar.setBackground(new Color(214, 219, 223));
        this.botonAnalizar.setFont(new Font("Gadugi",Font.BOLD,14));
        this.panel.add(botonAnalizar);






    }

    private void areaTexto(){
        this.textarea1 = new JTextArea();
        this.textarea1.setLineWrap(true); //Para que salte de línea al llegar al final del ancho del jTextArea
        this.textarea1.setBorder(border);
        this.scrollpane1 = new JScrollPane(textarea1);
        this.scrollpane1.setBounds(60,360,500,300);
        this.panel.add(scrollpane1);

    }

}
