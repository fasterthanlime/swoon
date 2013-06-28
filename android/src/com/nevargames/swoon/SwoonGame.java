package com.nevargames.swoon;

import org.libsdl.app.SDLActivity;

public class SwoonGame extends SDLActivity {

    // Load the .so
    static {
        System.loadLibrary("SDL2");
        System.loadLibrary("sdk");
        System.loadLibrary("deadlogger");
        System.loadLibrary("sdl2");
        System.loadLibrary("freetype2");
        System.loadLibrary("stb-image");
        System.loadLibrary("dye");
        System.loadLibrary("yaml");
        System.loadLibrary("chipmunk");
        System.loadLibrary("gnaar");
        System.loadLibrary("swoon");
        System.loadLibrary("main");
    }

}

