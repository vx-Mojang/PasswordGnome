import std/random
import std/strutils

proc MOTD() =
    const motdmessage = """
                __
             .-'  |        mm@***@m@                                                  *@@@***@@m
            /   <\|      m@@*     *@                                                    @@   *@@m
           /     \'      @@*       * *@@@@@@@@m    m@@*@@m *@@@@@@@@m@@@@@m    mm@*@@   @@   m@@  m@*@@m   m@@*@@@ m@@*@@@
           |_.- o-o      @!            @@    @@   @@*   *@@  @@    @@    @@   m@*   @@  @@@@@@@  @@   @@   @@   ** @@   **
           / C  -._)\    @!m    *@@@@  @!    @@   @@     @@  !@    @@    @@   !@******  @@        m@@@!@   *@@@@@m *@@@@@m
          /',        |   *!@m     @@   @!    !@   @@     !@  !@    !@    @@   !@m    m  @!       @!   !@        @@      @@
         |   `-,_,__,'   !!!    *!@!!  !!    !!   !@     !!  !!    !!    !!   !!******  @!        !!!!:!   *!   @! *!   @!
         (,,)====[_]=|   *:!!     !!   !!    !!   !!!   !!!  :!    :!    !!   :!!       !!       !!   :!   !!   !! !!   !!
           '.   ____/      ::: : ::  : :::  :!: :  : : : : : :!:  :::   ::!:   : : :: :!:!:      :!: : !:  : :!:   : :!:
            | -|-|_
            |____)_)
    """
    stdout.write(motdmessage,"\n\n")

proc option(question: string): bool =
    echo r"[y/N] ", question
    var yorn: string = readLine(stdin)
    if yorn == "y":
        return true
    elif yorn == "y":
        return true
    else:
        return false

proc generate(length: int,specialchar: bool,numberchar:bool) =
    stdout.write "Password: "
    for i in countup(1,length):
        if specialchar:
            let specialcharacterset = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z","!","?","$","%","&","=","-","_","#","'","*","+"]
            let pick = sample(specialcharacterset)
            doAssert pick in specialcharacterset
            stdout.write pick
        if numberchar:
            let numbercharacterset = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z","1","2","3","4","5"]
            let pick = sample(numbercharacterset)
            doAssert pick in numbercharacterset
            stdout.write pick
        if numberchar and specialchar:
            let specialnumberchatset = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z","!","?","$","%","&","=","-","_","#","'","*","+"]
            let pick = sample(specialnumberchatset)
            doAssert pick in specialnumberchatset
            stdout.write pick            
        else:
            let characterset = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
            let pick = sample(characterset)
            doAssert pick in characterset
            stdout.write pick
    echo ""

#-- Main ->
MOTD()

echo "> How Long?"
var length: string = readLine(stdin)
var specialchar: bool = option("> Use Special Characters?")
var numberchar: bool = option("> Use Numbers?")

randomize()

try:
    var length_int = parseInt(length)
    generate(length_int,specialchar,numberchar)

except ValueError:
    echo "\nInvalid Type Provided for Length\nPlease input a Number!"