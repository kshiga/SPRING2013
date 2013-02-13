    ; Homework 5
    ; Problem 2
    ; Kaitlyn Higa
    ;
    ; r1: quotient
    ; r2: dividend/remainder
    ; r3: divisor
    ; r4: branch destination address
    ; r5: proc pointer
    ; r6: branch condition/calculation of dividend - divisor
    ; r7: stored program counter (returned address from subroutine)
    ; 
    ; NOTE: To Run, XXXXXMEMORY ADDRESS HEREXXXXXX  must be replaced with a valid memory address.
    ;          and  XXXXXCODE ADDRESS HEREXXXXXX    must be replaced with a valid address.
    ;       ** DO NOT SET THE SAME VALUE TO BOTH XXXXXMEMORY ADDRESS HEREXXXXXX 
    ;                                        AND XXXXXCODE ADDRESS HEREXXXXXX.
    ;  
    ;
    ; *lines that have been commented out are only used for testing purposes.

                .org  XXXXX MEMORY ADDRESS HEREXXXXXX  ;* REPLACE XXXXXMEMORY ADDRESS HEREXXXXXX 
                                                       ;  with your target memory address
    dividend:   .dc  DIVIDEND        ; * REPLACE with decimal value DIVIDEND
    divisor:    .dc  DIVISOR         ; * REPLACE with decimal value DIVISOR
    quotient:   .dc  0
    remainder:  .dc  0

                .org XXXXXCODE ADDRESS HEREXXXXXX      ;* REPLACE XXXXXCODE ADDRESS HEREXXXXXX 
                                                       ;  with your target address for the code
                ldr  r2, dividend    ; r2: dividend
                ldr  r3, divisor     ; r3: divisor
                lar  r5, proc        ; r5: points to procedure
                brl  r7, r5          ; r7: gets pc of procedure
          
                st r1, quotient      ; stores quotient
                st r2, remainder     ; stores remainder

               ;ldr  r20, quotient   ; test to see stored quotient
               ;ldr  r21, remainder  ; test to see stored remainder

                stop                 ; stops program

    proc:       la  r1, 0            ; sets quotient to 0
                la  r6, 0            ; sets condition to  0
                lar  r4, loop        ; give r4 loop pointer
 
    loop:       sub   r2, r2, r3     ; subtracts divisor from dividend and stores in r2
                addi  r1, r1, 1      ; increments quotient
                sub   r6, r2, r3     ; calculates (most-current) dividend - divisor
                brpl   r4, r6        ; if (most-current) dividend - divisor is greater than or equal to zero, we loop.
                                     ; this means that there the dividend has at least one instance of the divisor in
                                     ; it, thus, we can run through the loop again without getting a negative remainder
                                     ; and incrementing the quotient to greater than what it should be.
                                     ;
                br r7                ; after the branch condition yields false, we load the address at r7 
                                     ; into the program counter, which sould bring us back to the linked branch

          
