import std/random
import std/strutils

proc generate(length: int) =
    stdout.write "Password: "
    for i in countup(1,length):
        let characterset = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
        let pick = sample(characterset)
        doAssert pick in characterset
        stdout.write pick
    echo ""
#-- Main ->

echo "How Long?"
var length: string = readLine(stdin)
randomize()

try:
    var length_int = parseInt(length)
    generate(length_int)

except ValueError:
    echo "\nInvalid Type Provided\nPlease input a Number!"