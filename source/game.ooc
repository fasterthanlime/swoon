
// third-party stuff
use deadlogger
import deadlogger/[Log, Logger]

use dye
import dye/[core, input, primitives, sprite, math]

use sdl2
import sdl2/Core

use chipmunk
import chipmunk

// sdk stuff
import structs/[ArrayList]

// our stuff
import swoon/[logging, level, ball]

App: class {

  logger: Logger
  dye: DyeContext

  paused := false
  running := true
  
  level: Level

  init: func {
    Logging setup()

    logger = Log getLogger("Swoon")
    logger info("Starting swoon...")

    dye = DyeContext new(480, 800, "swoon")

    initEvents()

    level = Level new()
    dye add(level group)

    level add(Ball new(level))

    run()
    dye quit()
  }

  initEvents: func {

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

  }

  run: func {
    color := Color new(0, 0, 0)
    dye setClearColor(color)

    while (running) {
        dye poll()

        if (!paused) {
            level update()
            dye render()
        }

        SDL delay(16)
    }
  }


}

/* Entry point */
main: func (args: ArrayList<String>) {
  App new()
}

