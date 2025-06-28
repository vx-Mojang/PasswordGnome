import std/random
import std/strutils

proc counting(length: int) =
    echo "\n"
    for i in countup(1,length):
        
        echo "Toast x",i,"\r"

#-- Main ->

echo "How Much?"
randomize()

var length: string = readLine(stdin)
try:
    var length_int = parseInt(length)
    counting(length_int)
except ValueError:
    echo "\nInvalid Type Provided\nPlease input a Number!"