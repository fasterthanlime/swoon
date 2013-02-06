
// third-party stuff
use deadlogger
import deadlogger/[Log, Logger, Handler, Formatter, Filter, Level]

use dye, sdl2
import sdl2/Core

// sdk stuff
import structs/[ArrayList]

main: func (args: ArrayList<String>) {
  App new()
}

App: class {

  logger: Logger
  dye: DyeContext

  init: func {
    initLogging()
    logger info("Starting swoon...")

    dye = DyeContext new(480, 800, "swoon")

    run()
    exit()
  }

  run: func {
    dye setClearColor(Color new(240, 128, 128))
    dye render()

    while (true) {
        SDL delay(1000)
    }
  }

  exit: func {
    dye quit()
    exit(0)
  }

  initLogging: func {
    // log to console
    console := StdoutHandler new()
    formatter := NiceFormatter new()
    version (!windows && !android) {
        formatter = ColoredFormatter new(formatter)
    }
    console setFormatter(formatter)
    console setFilter(LevelFilter new(Level info..Level critical))
    Log root attachHandler(console)
  
    logger = Log getLogger("Swoon")
  }


}

