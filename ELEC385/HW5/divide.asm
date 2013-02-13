    ; Homework 5
    ; Problem 1
    ; Kaitlyn Higa
    ;
    ; r1: quotient
    ; r2: dividend/remainder
    ; r3: divisor
    ; r4: branch destination address
    ; r5: pointer data
    ; r6: branch condition/calculation of (divisor - divisor))
          
          .org 0xF0
          .dc  45
          .dc  5

          .org  0xA000
          la    r1, 0        ; r1: quotient
          la    r5, 0xF0   ; r5: pointer data
          ld    r2, 0(r5)     ; r2: dividend/remainder 
          ld    r3, 4(r5)     ; r3: divisor
          lar   r4, loop      ; r4: branch destination address

    loop:  sub   r2, r2, r3    ; subtracts divisor from dividend and stores in r2
          addi  r1, r1, 1     ; increments quotient
          sub   r6, r2, r3    ; calculates (most-current) dividend - divisor
          brpl   r4, r6       ; if (most-current) dividend - divisor is greater than or equal to zero, we loop.
                            ; this means that there the dividend has at least one instance of the divisor in
                            ; it, thus, we can run through the loop again without getting a negative remainder
                            ; and incrementing the quotient to greater than what it should be 
          st    r1, 8(r5)     ; stores quotient in F8
          st    r2, 12(r5)    ; stores remainder in FC
          stop
