import UIKit

//easy tasks
//#1
var fruits: [String] = ["apple", "lemon", "orange", "pineapple", "peach" ]
print(fruits[2])

//#2
var favoriteNumbers : Set<Int> = [1, 7, 10]
favoriteNumbers.insert(21)
print(favoriteNumbers)

//#3
var programLanguages: [String:Int] = ["C++": 1983, "Swift": 2007, "Python": 1991]
print(programLanguages["Swift"]!) //provide default value

//#4
var colors: [String] = ["red", "pink", "black", "white"]
colors.insert("yellow", at: 1)
print(colors)

//medium tasks
//#1
var firstset: Set<Int> = [1, 2, 3, 4]
var secondset: Set<Int> = [3, 4, 5, 6]
let intersectionset = firstset.intersection(secondset)
print(intersectionset)

//#2
var studentScores:[String:Float] = ["Askar": 67.5, "Medet": 90.7, "Aliya": 99]
studentScores["Askar"] = 80.5
print(studentScores)

//#3
var first: [String] = ["apple", "banana"]
var second: [String] = ["cherry", "date"]
var third = first + second
print(third)

//hard tasks
//#1
var countryPopulation: [String:Int] = ["India": 1450935791,
                                      "China": 1419321278,
                                      "United States": 345426571]
countryPopulation["Kazakhstan"] = 20592571
print(countryPopulation)

//#2
var oneset: Set<String> = ["cat", "dog"]
var twoset: Set<String> = ["dog", "mouse"]
var finalset = oneset.union(twoset)
finalset = finalset.subtracting(twoset)
print(finalset)

//#3
var studentGrades: [String: [Int]] = ["Alice": [90, 87, 90],
                                      "Bob": [78, 90,67],
                                      "Charlie": [92, 94, 89]]
let secondGrade = studentGrades["Bob"]?[1]
print(secondGrade!)
