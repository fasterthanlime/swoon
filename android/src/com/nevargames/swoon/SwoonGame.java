package com.nevargames.swoon;

import org.libsdl.app.SDLActivity;

public class SwoonGame extends SDLActivity {

    // Load the .so
    static {
        System.loadLibrary("SDL2");
        System.loadLibrary("sdk");
        System.loadLibrary("deadlogger");
        System.loadLibrary("sdl2");
        System.loadLibrary("stbi");
        System.loadLibrary("dye");
        System.loadLibrary("swoon");
        System.loadLibrary("main");
    }

}

