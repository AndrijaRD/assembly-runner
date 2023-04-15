# assembly-runner
compiles, runs and debugs assembly files

How to use:
$ cd /opt
$ git clone https://github.com/AndrijaRD/assembly-runner
$ cd assembly-runner
$ chmod -x asm
$ ./asm file.asm

If you want u can make it executable anywhere by adding alise
$ echo "alias asm='/opt/assembly-runner/asm'" >> ~/.zshrc
$ echo "alias asm='/opt/assembly-runner/asm'" >> ~/.bashrc
$ source ~/.zshrc
$ source ~/.zshrc

And now just:
$ asm file.asm

This python script first compiles the asm into object file and then into outfile,
then it runs the program and displays the output and return code, then it asks
if it shoud run the gdb (debuger) with custom breakpoint and some others arguments
like displaying value of every general use register, for going to the next line 
user uses command "stepi" for seeing the value of memory location in ram use command
x/x $memorylocation, example: "x/x 0x4020d4", for manually seeing the value of register
he can use command "info registers" or "i r", example "info registers eax" or "i r eax"
