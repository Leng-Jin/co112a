// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.

@2
    M=0     // 將R2設置為0
    @i
    M=0     // 將i設置為0

(LOOP)
    @i
    D=M     // D存儲i的值
    @0
    D=D-M   // D等於i減去R0
    @END
    D;JGE    // 如果i-R0大於等於0，則跳轉到END標籤

    @1
    D=M     // D存儲R1的值
    @2
    M=D+M   // 將R2設置為R2加上R1的值
    @i
    M=M+1   // 將i加1
    @LOOP
    0;JMP   // 跳轉到LOOP標籤，進行下一輪迴圈

(END)
    @END
    0;JMP   // 跳轉到END標籤，結束程序
