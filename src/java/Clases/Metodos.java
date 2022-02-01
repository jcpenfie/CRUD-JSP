package Clases;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Juan Carlos
 */
public class Metodos {

    public static void guardarDato(String dato, String fichero) {
        try {

            BufferedWriter bw = new BufferedWriter(new FileWriter(fichero));
            bw.write(dato);
            bw.close();
        } catch (IOException e) {
            System.out.print("No se ha podido escribir en el archivo");
        }
    }

    public static void guardarDatoN(int dato, String fichero) {
        try {

            BufferedWriter bw = new BufferedWriter(new FileWriter(fichero));
            bw.write(dato);
            bw.close();
        } catch (IOException e) {
            System.out.print("No se ha podido escribir en el archivo");
        }
    }

    public static int LeerDatoN(String fichero) {
        int dato = 0;
        try {
            BufferedReader bf = new BufferedReader(new FileReader(fichero));
            dato = Integer.valueOf(bf.readLine());
            bf.close();
        } catch (IOException e) {
            System.out.print("No se ha podido escribir en el archivo");
        }
        return dato;
    }

    private static Object getServletContext() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
