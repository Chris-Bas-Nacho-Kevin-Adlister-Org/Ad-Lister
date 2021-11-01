package com.codeup.adlister.dao;


import ij.IJ;
import ij.ImagePlus;
import ij.process.ImageProcessor;

import java.awt.*;

public class ImageCopier {

    public static void main(String[] args) {

        Image image = new Image("/WEB-INF/ads/tools.png");
        image.readImage();

    }
















//    private static final int BUFFER = 4096;
//    private static final String IMAGE_PATH = "/Users/phoenix/IdeaProjects/Ad-Lister/src/main/webapp/WEB-INF/ads/tools.png";
//    private static final String OUTPUT_IMAGE_PATH = "/Users/phoenix/IdeaProjects/Ad-Lister/src/main/webapp/WEB-INF/ads/tools_output.png";
//
//    public static void imageReader(){
//        try{
//            InputStream is = new FileInputStream(IMAGE_PATH);
//            OutputStream os = new FileOutputStream(OUTPUT_IMAGE_PATH);
//            {
//                byte[] imageBuffer = new byte[BUFFER];
//                int bytesRead = -1;
//
//                while((bytesRead = is.read(imageBuffer)) != -1){
//                    os.write(imageBuffer, 0, bytesRead);
//                }
//            }
//        }catch (IOException e){
//            e.printStackTrace();
//        }
//    }
}
