```scala
package prob15

import chisel3._
import chisel3.util._
import chisel3.io._

class Prob_6_7_Moore extends Module {
  val io = IO(new Bundle {
    val D_in = Input(Bool())
    val clk  = Input(Clock())
    val rst  = Input(Bool())
    val Detect_Moore = Output(Bool())
  })

  val Detect_Moore = io.Detect_Moore

  val Detect_Moore_reg = Reg(Bool()) init (false)
  Detect_Moore := (io.state_Moore === Seq(S_1, S_2, S_3, S_4))

  val state_Moore = Reg(UInt(width = 4.W, reset = 0.B)) init (0.U)

  when (io.rst) {
    state_Moore := 0.U
  }.otherwise {
    state_Moore := next_state
  }

  val next_state = Reg(UInt(width = 4.W, reset = 0.B)) init (0.U)

  when (io.state_Moore === 0) {
    next_state := 0.U
  }.otherwise {
    next_state := next_state2
  }

  val next_state2 = Reg(UInt(width = 4.W, reset = 0.B)) init (0.U)

  when (io.state_Moore === 0) {
    next_state2 := 0.U
  }.otherwise {
    next_state2 := next_state3
  }

  val next_state3 = Reg(UInt(width = 4.W, reset = 0.B)) init (0.U)

  when (io.state_Moore === 0) {
    next_state3 := 0.U
  }.otherwise {
    next_state3 := next_state4
  }

  val next_state4 = Reg(UInt(width = 4.W, reset = 0.B)) init (0.U)

  when (io.state_Moore === 0) {
    next_state4 := 0.U
  }.otherwise {
    next_state4 := next_state5
  }

  val next_state5 = Reg(UInt(width = 4.W, reset = 0.B)) init (0.U)

  when (io.state_Moore === 0) {
    next_state5 := 0.U
  }.otherwise {
    next_state5 := next_state6
  }

  val next_state6 = Reg(UInt(width = 4.W, reset = 0.B)) init (0.U)

  when (io.state_Moore === 0) {
    next_state6 := 0.U
  }.otherwise {
    next_state6 := next_state7
  }

  val next_state7 = Reg(UInt(width = 4.W, reset = 0.B)) init (0.U)

  when (io.state_Moore === 0) {
    next_state7 := 0.U
  }.otherwise {
    next_state7 := next_state8
  }

  val next_state8 = Reg(UInt(width = 4.W, reset = 0.B)) init (0.U)

  when (io.state_Moore === 0) {
    next_state8 := 0.U
  }.otherwise {
    next_state8 := next_state9
  }

  val next_state9 = Reg(UInt(width = 4.W, reset = 0.B)) init (0.U)

  when (io.state_Moore === 0) {
    next_state9 := 0.U
  }.otherwise {
    next_state9 := next_state10
  }

  val next_state10 = Reg(UInt(width = 4.W, reset = 0.B)) init (0.U)

  when (io.state_Moore === 0) {
    next_state10 := 0.U
  }.otherwise {
    next_state10 := next_state11
  }

  val next_state11 = Reg(UInt(width = 4.W, reset = 0.B)) init (0.U)

  when (io.state_Moore === 0) {
    next_state11 := 0.U
  }.otherwise {
    next_state11 := 0.U
  }

  when (io.state_Moore === 0) {
    if (io.D_in) {
      next_state := 1.U
    }
    else if (!(io.D_in)) {
      next_state := 5.U
    }
  }.otherwise {
    if (io.state_Moore === 1) {
      if (io.D_in) {
        next_state := 2.U
      }
      else if (!(io.D_in)) {
        next_state := 5.U
      }
    }.otherwise {
      if (io.state_Moore === 2) {
        if (io.D_in) {
          next_state := 3.U
        }
        else if (!(io.D_in)) {
          next_state := 5.U
        }
      }.otherwise {
        if (io.state_Moore === 3) {
          if (io.D_in) {
            next_state := 3.U
          }
          else if (!(io.D_in)) {
            next_state := 4.U
          }
        }.otherwise {
          if (io.state_Moore === 4) {
            if (io.D_in) {
              next_state := 1.U
            }
            else if (!(io.D_in)) {
              next_state := 6.U
            }
          }.otherwise {
            if (io.state_Moore === 5) {
              if (io.D_in) {
                next_state := 1.U
              }
              else if (!(io.D_in)) {
                next_state := 6.U
              }
            }.otherwise {
              if (io.state_Moore === 6) {
                if (io.D_in) {
                  next_state := 1.U
                }
                else if (!(io.D_in)) {
                  next_state := 7.U
                }
              }.otherwise {
                if (io.state_Moore === 7) {
                  if (io.D_in) {
                    next_state := 8.U
                  }
                  else if (!(io.D_in)) {
                    next_state := 7.U
                  }
                }.otherwise {
                  if (io.state_Moore === 8) {
                    if (io.D_in) {
                      next_state := 1.U
                    }
                    else if (!(io.D_in)) {
                      next_state := 6.U
                    }
                  }.otherwise {
                    next_state := 0.U
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}
```