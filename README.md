# Assembly-Runner

`assembly-runner` is a tool that allows you to compile, run and debug assembly files. 

## Usage

To use `assembly-runner`:

1. Clone the repository by running the following command: 

    ```
    cd /opt
    git clone https://github.com/AndrijaRD/assembly-runner
    cd assembly-runner
    ```

2. Make the `asm` script executable by running:

    ```
    chmod +x asm
    ```

3. Run your assembly program:

    ```
    ./asm file.asm
    ```

### Optional: Create an alias

If you want to make the `asm` script executable from anywhere, you can create an alias by running the following commands:
```
echo "alias asm='/opt/assembly-runner/asm'" >> ~/.zshrc
echo "alias asm='/opt/assembly-runner/asm'" >> ~/.bashrc
source ~/.zshrc
source ~/.zshrc
```

Now you can run your assembly program from anywhere:
```
asm file.asm
```
## How it works

`assembly-runner` compiles your assembly program into an object file, then into an executable file. It runs the program and displays the output and return code. 

If you want to use the debugger (gdb), you can specify custom breakpoints and other arguments. You can display the value of every general use register by using the command `info registers` or `i r`. To see the value of a memory location in RAM, use the command `x/x $memorylocation`, for example: `x/x 0x4020d4`. To manually see the value of a register, use the command `info registers <register>` or `i r <register>`, for example: `info registers eax` or `i r eax`.
