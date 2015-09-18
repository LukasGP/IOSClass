//: Playground - noun: a place where people can play

import UIKit

var myName = "Lukas"

var time = 15

if (myName == "Lukas" && time < 12)
{
    println("Good morning Lukas")
}else if(myName == "Lukas" && time > 12){
    println("Good afternoon Lukas")
}else{
    println("Who are you?")
}

if(myName == "Lukas" || time < 20)
{
    println("One or more statement is true")
}
// Can test for divisibility
var remainder = 9 % 3

var x = 44

if(x % 2 == 0)
{
    println("\(x) is an even number")
}else {
    println("\(x) is an odd number")
}

var randomNumber = arc4random_uniform(10)

var array = [2.0,3.0,5.0,4.0]
for x in array
{
    println(x)
}

for(index,x) in enumerate(array)
{
    array[index] = x/2.0
}

println(array)

var i = 2

while (i < 20)
{
    println(i)
    i+=2
}
//typically use for loops for arrays
var arr = [6,2,9,1,2,3]
var index = 0
while (index < arr.count)
{
    arr[index] = arr[index] - 1
    println(arr[index])
    index++
}


