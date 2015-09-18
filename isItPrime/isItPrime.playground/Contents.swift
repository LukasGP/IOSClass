//: Playground - noun: a place where people can play

import UIKit

var inputNum = 3

var count = 1
var isItPrime = 0

while(count<=inputNum)
{
    if(inputNum%count == 0)
    {
        isItPrime++
    }
    count++
}
if(isItPrime == 2 && inputNum > 1)
{
    println("\(inputNum) is a prime number")
}else {
    println("Please input a valid number")
}