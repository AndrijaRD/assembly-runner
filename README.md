assembly-runner
This is a python script that compiles, runs and debugs assembly files. Here's how to use it:

shell
Copy code
$ cd /opt
$ git clone https://github.com/AndrijaRD/assembly-runner
$ cd assembly-runner
$ chmod -x asm
$ ./asm file.asm
If you want to make the script executable from anywhere, you can add an alias to your shell configuration file:

shell
Copy code
$ echo "alias asm='/opt/assembly-runner/asm'" >> ~/.zshrc
$ echo "alias asm='/opt/assembly-runner/asm'" >> ~/.bashrc
$ source ~/.zshrc
$ source ~/.zshrc
Now you can simply run asm file.asm from anywhere in the terminal.

The script first compiles the assembly code into an object file and then into an executable outfile. It then runs the program and displays the output and return code. If you want to run the gdb debugger with a custom breakpoint and some other arguments (such as displaying the value of every general use register), simply type y when prompted. Once inside gdb, use the following commands:

stepi to go to the next line
x/x $memorylocation to see the value of a memory location in RAM (for example: x/x 0x4020d4)
info registers or i r to see the value of a register (for example: info registers eax or i r eax)
