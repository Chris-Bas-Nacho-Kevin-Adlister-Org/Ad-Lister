package com.codeup.adlister.dao;

import ij.IJ;
import ij.ImagePlus;
import ij.process.ImageProcessor;


public class Image implements Images{

    private String IMAGE_PATH_TOOLS = "";

    public Image(String path){
        this.IMAGE_PATH_TOOLS = path;
    }

    public void readImage(){

        ImagePlus imp = IJ.openImage();

        ImageProcessor ip = imp.getProcessor();

        imp.show();
    }
}
