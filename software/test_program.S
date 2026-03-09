# ============================================================
#  test_program.S  –  RISC-V Assembly Test Program
#  Tests: arithmetic, load/store, branching, loops
#
#  Assemble with:  riscv32-unknown-elf-as test_program.S -o test_program.o
#                  riscv32-unknown-elf-objcopy -O ihex test_program.o program.hex
# ============================================================

.section .text
.globl _start

_start:
    # ---- Test 1: Basic arithmetic ----
    addi  x1, x0, 10       # x1 = 10
    addi  x2, x0, 6        # x2 = 6
    add   x3, x1, x2       # x3 = 16
    sub   x4, x1, x2       # x4 = 4
    and   x5, x1, x2       # x5 = 2  (0b1010 & 0b0110)
    or    x6, x1, x2       # x6 = 14 (0b1010 | 0b0110)
    xor   x7, x1, x2       # x7 = 12 (0b1010 ^ 0b0110)

    # ---- Test 2: Shifts ----
    slli  x8,  x1, 2       # x8  = 40 (10 << 2)
    srli  x9,  x8, 1       # x9  = 20 (40 >> 1)
    srai  x10, x8, 1       # x10 = 20 (arithmetic)

    # ---- Test 3: Forwarding hazard (back-to-back) ----
    addi  x11, x0, 5
    add   x12, x11, x11    # x12 = 10 (fwd x11 from EX/MEM)
    add   x13, x12, x11    # x13 = 15 (fwd x12 from EX/MEM, x11 from MEM/WB)

    # ---- Test 4: Load-use hazard (stall required) ----
    addi  x14, x0, 0xABC   # x14 = 0xABC
    sw    x14, 0(x0)        # mem[0] = 0xABC
    lw    x15, 0(x0)        # x15 = 0xABC (load-use stall on next)
    addi  x16, x15, 1      # x16 = 0xABD  (needs stall)

    # ---- Test 5: Loop (branch test) ----
    addi  x17, x0, 0       # counter = 0
    addi  x18, x0, 5       # limit   = 5
loop:
    addi  x17, x17, 1      # counter++
    blt   x17, x18, loop   # if counter < 5 goto loop
    # x17 == 5 after loop

    # ---- Test 6: JAL (function call) ----
    jal   x19, func_add    # x19 = PC+4, jump to func_add
    addi  x20, x0, 0xFF    # skipped by jal

func_add:
    addi  x20, x0, 42      # x20 = 42

    # ---- Done: spin loop ----
done:
    j done
