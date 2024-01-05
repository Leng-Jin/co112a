// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

@place // 起始點
  M=0 // 放置在左上角

(LOOP)
  @KBD // 讀取鍵盤值
  D=M // 將其放入 D
  @WHITE
  D;JEQ // 如果鍵盤值 == 0（未按下） 轉到 WHITE
  @BLACK
  0;JMP // 否則，轉到 BLACK

(WHITE)
  @place
  D=M // 將 place 放入 D
  @LOOP
  D;JLT // 如果我們在最小值（0）以下，跳轉到 LOOP
  @place
  D=M
  @SCREEN
  A=A+D // 計算在屏幕上的位置
  M=0 // 填充像素為白色
  @place
  M=M-1 // 減少 place
  @LOOP
  0;JMP // 跳回 LOOP

(BLACK)
  @place
  D=M
  @8192 // place 的最大值
  D=D-A
  @LOOP
  D;JGE // 如果我們在最大值（place - 8192 >= 0）以上，跳轉到 LOOP
  @place
  D=M
  @SCREEN
  A=A+D // 計算位置
  M=-1 // 填充像素為黑色
  @place
  M=M+1 // 將 place 增加 1
  @LOOP
  0;JMP // 跳回 LOOP

(END)
  @END
  0;JMP // 無窮循環在結尾
