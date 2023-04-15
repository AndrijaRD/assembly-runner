#!/bin/python3
from subprocess import call, check_output, CalledProcessError
import subprocess
import os
import sys

os.environ["PAGER"] = ""

args = sys.argv[1:]
filePath    = args[0]
fileName    = filePath.split("/")[len(filePath.split("/"))-1]
oFileName   = fileName.replace(".asm", ".o")
oFilePath   = "./out/"+oFileName
outFileName = fileName.replace(".asm", "")
outFilePath = "./build/"+outFileName

YELLOW = "\033[33m"
GREEN  = "\033[32m"
WHITE  = "\033[37m"
RED    = "\033[31m"
BLUE   = "\033[34m"

#print(f"{GREEN}[*]{WHITE} CREAING {YELLOW}\"BUILD\"{WHITE}, {YELLOW}\"SRC\"{WHITE} AND {YELLOW}\"OUT\"{WHITE} FOLDERS\n")
#if(os.path.exisits("./ASM_SRC"))
print(f"{RED}--------------------------------------{WHITE}")

print(f"{YELLOW} [*] COMPILING THE ASM CODE{RED}")

call(["rm", "-fr", oFilePath])
try:
    output = check_output(["nasm", "-f", "elf64", "-o", oFilePath, filePath])
except CalledProcessError as e:
    print(f"\n {RED}[!] ERROR{WHITE}")
    sys.exit(1)

call(["rm", "-fr", outFilePath])
call(["ld", "-o", outFilePath, oFilePath])

print(f"{GREEN} [*] SUCCESFULL. RUNNING THE OUTFILE.{WHITE}")
print(f"\n     {BLUE}{outFileName.upper()}{WHITE}             ")
print("____________________________________\n")
try:
    ret_code = call([outFilePath])
    print("\n____________________________________\n")
    print(f"{BLUE} [*] RETURN STATUS{WHITE}: {ret_code}")
except:
    print("\n____________________________________\n")
    print(f" {RED}[*] ERROR. ABORING.{WHITE}")
print(f"{RED}--------------------------------------{WHITE}")
answer=input(f"Run GDB? [{GREEN}y{WHITE}/{RED}n{WHITE}] ").lower()

if("y" in answer):
    breakFunc=input(f"Break functin (default: {RED}_start{WHITE}): ")
    if(breakFunc == "" or breakFunc == " "):
        breakFunc="_start"
    call([
            "gdb",
            "-ex",
            "set confirm off",
            "-ex",
            "set pagination off",
            "-ex",
            f"break {breakFunc}",
            "-ex",
            "run",
            "-ex",
            "layout asm",
            "-ex",
            "i r eax",
            "-ex",
            "i r ebx",
            "-ex",
            "i r ecx",
            "-ex",
            "i r edx",
            "-ex",
            "i r edi",
            "-ex",
            "i r esi",
            outFilePath
        ])
