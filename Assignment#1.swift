//
//  Assignment#1.swift
//  
//
//  Created by Kemel Merey on 06.09.2024.
//

import Foundation

//step 1
var firstName: String = "Merey"
var lastName: String = "Kemel"
var age: Int = 20
var birthYear: Int = 2004
var isStudent: Bool = true
var height: Double = 167.5
//more info about me
var numberOfSiblings: Int = 4
var graduationYear: Int = 2022


//bonus challenge
let currentYear: Int = 2024
let calculatedAge: Int = currentYear - birthYear

//step 2
var hobby: String = "listening music"
var numberOfHobbies: Int = 3
var favouriteNumber: Int = 21
var isHobbyCreative: Bool = true

//more info about my interests
var favouriteSinger: String = "Lisa"
var favouriteMusicGenre: String = "any"

//step 3
let summary: String = """
My name is \(firstName) \(lastName). I am \(age) years old, born in \(birthYear). I am currently \(isStudent ? "a student" : "not a student"). I enjoy \(hobby), which is \(isHobbyCreative ? "a creative" : "not a creative") hobby. I have \(numberOfHobbies) hobbies in total, and my favorite number is \(favoriteNumber).
"""


//step 4
//summary == final life story
print(summary)

//bonus task
var futureGoals: String = "In the future, I want to become a professional programmer 💻."

let 💯: String = """
\(summary) \(futureGoals)
"""

print(💯)


