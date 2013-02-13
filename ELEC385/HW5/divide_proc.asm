    ; Homework 5
    ; Problem 2
    ; Kaitlyn Higa
    ;
    ; r1: quotient
    ; r2: dividend/remainder
    ; r3: divisor
    ; r4: branch destination address
    ; r5: pc/proc pointer
    ; r6: calculation of 2 * divisor    bnb n bn 
    ; r7: branch condition/calculation of (divisor - (2 * divisor))
    ; r8: stored program counter (returned address from subroutine)

            .org  0xF0  ;store values at 0xF0
    dividend: .dw  45 
    divisor:  .dw  5
    quotient:  .dw  0
    remainder:  .dw  0

          .org 0xA000
          la  r2, dividend   ; r2: dividend
          la  r3, divisor    ; r3: divisor
          lar  r5, proc      ; r5: points to procedure
          brl  r8, r5       ; r8 gets pc of procedure

          st r1, quotient    ; stores quotient
          st r2, remainder  ; stores remainder
          stop             ; stops program

    proc:  la  r1, 0         ; sets quotient to 0
          add  r6, r3, r3    ; calculates 2 * divisor
          lar  r4, loop      ; give r4 loop pointer

    loop:  sub   r2, r2, r3    ; subtracts divisor from dividend and stores in r2
          addi  r1, r1, 1     ; increments quotient
          sub   r7, r2, r6    ; calculates (most-current) dividend - 2(divisor)
          brpl   r4, r7       ; if (most-current) dividend - 2(divisor) is greater than or equal to zero, we loop.
                            ; this means that there the dividend has at least one instance of the divisor in
                            ; it, thus, we can run through the loop again without getting a negative remainder
                            ; and incrementing the quotient to greater than what it should be  
          br r8
