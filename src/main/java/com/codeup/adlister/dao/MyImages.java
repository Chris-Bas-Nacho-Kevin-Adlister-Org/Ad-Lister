//package com.codeup.adlister.dao;
//import jdk.swing.interop.SwingInterOpUtils;
//
//import javax.imageio.ImageIO;
//import java.io.File;
//import java.io.IOException;
//import java.awt.image.BufferedImage;
//public class MyImages {
//
//    public static void main(String[] args) throws IOException {
//        int width = 200;
//        int height = 200;
//
//        BufferedImage image = null;
//
//        image = readFromFile(width, height, image);
//
//        writeTofile(image);
//    }
//
//    private static BufferedImage readFromFile(int width, int height, BufferedImage image) {
//        try{
//            File newImage = new File("src/main/webapp/WEB-INF/ads/tools.png");
//
//            //CREATING AN IMAGE OBJECT
//            image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
//
//            //READING INPUT FILE
//            image = ImageIO.read(newImage);
//
//        }catch (IOException e){
//            System.out.println("error: " + image);
//        }
//            return image;
//    }
//
//    public static void  writeTofile(BufferedImage image){
//        try{
//            File output = new File("src/main/webapp/WEB-INF/ads/tools.png.output");
//
//            ImageIO.write(image, "png", output);
//
//            System.out.println("writing complete.");
//        }catch (IOException e){
//            System.out.println("Error: " + e);
//        }
//    }
//
//}