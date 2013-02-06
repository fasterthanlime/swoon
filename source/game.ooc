
// third-party stuff
use dye, sdl2
import sdl2/Core

// sdk stuff
import structs/[ArrayList]

main: func (args: ArrayList<String>) {
  App new()
}

App: class {

  dye: DyeContext

  init: func {
    dye = DyeContext new(480, 800, "swoon")

    run()
  }

  run: func {
    dye setClearColor(Color new(240, 128, 128))
    dye render()

    SDL delay(3000)
  }

  exit: func {
    dye quit()
    exit(0)
  }

}

