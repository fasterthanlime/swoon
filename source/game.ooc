
// third-party stuff
use deadlogger
import deadlogger/[Log, Logger, Handler, Formatter, Filter, Level]

version (android) {
    import deadlogger/AndroidHandler
}

use dye, sdl2
import sdl2/Core
import dye/[core, input, primitives]

// sdk stuff
import structs/[ArrayList]

main: func (args: ArrayList<String>) {
  App new()
}

App: class {

  logger: Logger
  dye: DyeContext

  paused := false
  running := true

  init: func {
    initLogging()
    logger info("Starting swoon...")

    dye = DyeContext new(480, 800, "swoon")
    dye input debug = true

    dye input onWindowMinimized(||
        paused = true
    )

    dye input onWindowRestored(||
        paused = false
    )

    // on Android, the back key quits
    dye input onKeyPress(|kev|
        match (kev scancode) {
            case KeyCode AC_BACK || KeyCode ESC =>
                running = false
        }
    )

    dye input onExit(||
        running = false
    )

    dye add(GlRectangle new())

    run()
    dye quit()
  }

  run: func {
    increment := 5
    color := Color new(240, 128, 128)

    while (running) {
        dye poll()

        if (!paused) {
            dye setClearColor(color)
            dye render()

            if (dye input isPressed(KeyCode MENU)) {
                color r += increment
                if (color r > 255 || color r < 0) {
                    color r -= increment
                    increment = -increment
                }
            }
        }

        //SDL delay(16)
        SDL delay(500)
    }
  }

  initLogging: func {
    version (android) {
        // log to Android handler
        Log root attachHandler(AndroidHandler new())
    } else {
        // log to console
        console := StdoutHandler new()
        formatter := NiceFormatter new()
        version (!windows) {
            formatter = ColoredFormatter new(formatter)
        }
        console setFormatter(formatter)
        console setFilter(LevelFilter new(Level info..Level critical))
        Log root attachHandler(console)
    }
  
    logger = Log getLogger("Swoon")
  }


}

