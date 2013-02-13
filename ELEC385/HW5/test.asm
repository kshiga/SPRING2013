count: .equ 5
      .org 0xF0
data:  .dc a
      .dc b
      .dc c
      .dc d
      .dc e
result: .dw 1

.org 0xA000
la r3, data
        
