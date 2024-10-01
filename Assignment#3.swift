import UIKit

//problem 1
var number = 1
while number <= 100 {
    if number%3==0 {
        if number%5==0{
            print("FizzBuzz")
        }
        else {print("Fizz")}
    } else if number%5==0 {
        print("Buzz")
    }
    else{print(number)}
    number=number+1
}


//problem 2
func isPrime(_ number: Int) -> Bool {
    if number <= 1 {
        return false
    }
    if number <= 3 {
        return true
    }
    for i in 2...Int(Double(number).squareRoot()) {
        if number % i == 0 {
            return false
        }
    }
    
    return true
}

for number in 1...100 {
    if isPrime(number) {
        print(number)
    }
}

//problem 3
func celsiusToFahrenheit(_ celsius: Double) -> Double {
    return (celsius * 9/5) + 32
}

func celsiusToKelvin(_ celsius: Double) -> Double {
    return celsius + 273.15
}

func fahrenheitToCelsius(_ fahrenheit: Double) -> Double {
    return (fahrenheit - 32) * 5/9
}

func fahrenheitToKelvin(_ fahrenheit: Double) -> Double {
    return (fahrenheit - 32) * 5/9 + 273.15
}

func kelvinToCelsius(_ kelvin: Double) -> Double {
    return kelvin - 273.15
}

func kelvinToFahrenheit(_ kelvin: Double) -> Double {
    return (kelvin - 273.15) * 9/5 + 32
}

print("Enter a temperature value:")
if let tempInput = readLine(), let temperature = Double(tempInput) {
    
    print("Enter the unit of the temperature (C, F, K):")
    if let unit = readLine() {
        
        switch unit.uppercased() {
        case "C":
            let fahrenheit = celsiusToFahrenheit(temperature)
            let kelvin = celsiusToKelvin(temperature)
            print("\(temperature)°C is equal to \(fahrenheit)°F and \(kelvin)K")
            
        case "F":
            let celsius = fahrenheitToCelsius(temperature)
            let kelvin = fahrenheitToKelvin(temperature)
            print("\(temperature)°F is equal to \(celsius)°C and \(kelvin)K")
            
        case "K":
            let celsius = kelvinToCelsius(temperature)
            let fahrenheit = kelvinToFahrenheit(temperature)
            print("\(temperature)K is equal to \(celsius)°C and \(fahrenheit)°F")
            
        default:
            print("Invalid unit. Please enter C, F, or K.")
        }
        
    } else {
        print("Invalid input for unit.")
    }
    
}

//problem 4
func shoppingListManager() {
    var shoppingList: [String] = []
    var running = true
    while running {
        print("""
        Shopping List Manager:
        1. Add an item
        2. Remove an item
        3. View the shopping list
        4. Exit
        Choose an option (1-4):
        """)
        if let choice = readLine() {
            switch choice {
            case "1":
                print("Enter the item to add:")
                if let newItem = readLine() {
                    shoppingList.append(newItem)
                    print("'\(newItem)' added to the shopping list.")
                }
            case "2":
                print("Enter the item to remove:")
                if let itemToRemove = readLine() {
                    if let index = shoppingList.firstIndex(of: itemToRemove) {
                        shoppingList.remove(at: index)
                        print("'\(itemToRemove)' removed from the shopping list.")
                    } else {
                        print("Item not found in the list.")
                    }
                }
            case "3":
                if shoppingList.isEmpty {
                    print("The shopping list is empty.")
                } else {
                    print("Shopping list:")
                    for (index, item) in shoppingList.enumerated() {
                        print("\(index + 1). \(item)")
                    }
                }
            case "4":
                running = false
                print("Goodbye!")
                
            default:
                print("Invalid option, please try again.")
            }
        }
    }
}
shoppingListManager()

//problem 5
func wordFrequencyCounter(_ sentence: String) {
    let lowercasedSentence = sentence.lowercased()
    let words = lowercasedSentence.split { !$0.isLetter && !$0.isWhitespace }
    var wordFrequencies: [String: Int] = [:]
    for word in words {
        let wordString = String(word)
        if let count = wordFrequencies[wordString] {
            wordFrequencies[wordString] = count + 1
        } else {
            wordFrequencies[wordString] = 1
        }
    }
    print("Word frequencies:")
    for (word, frequency) in wordFrequencies {
        print("\(word): \(frequency)")
    }
}
print("Enter a sentence:")
if let inputSentence = readLine() {
    wordFrequencyCounter(inputSentence)
}

//problem 6
func fibonacci(_ n: Int) -> [Int] {
    guard n > 0 else { return [] }
    var sequence = [0, 1]
    
    while sequence.count < n {
        let nextNumber = sequence[sequence.count - 1] + sequence[sequence.count - 2]
        sequence.append(nextNumber)
    }
    
    return Array(sequence.prefix(n))
}

print(fibonacci(10))


//problem 7

func gradeCalculator(students: [String: Int]) {
    let total = students.values.reduce(0, +)
    let average = total / students.count
    let highest = students.values.max() ?? 0
    let lowest = students.values.min() ?? 0
    
    print("Average Score: \(average)")
    print("Highest Score: \(highest)")
    print("Lowest Score: \(lowest)")
    
    for (name, score) in students {
        let status = score >= average ? "Above Average" : "Below Average"
        print("\(name) - \(score) (\(status))")
    }
}

func inputStudentGrades() {
    var students: [String: Int] = [:]
    while true {
        print("Enter student's name (or type 'done' to finish): ", terminator: "")
        guard let name = readLine(), name.lowercased() != "done" else {
            break
        }
        
        print("Enter score for \(name): ", terminator: "")
        if let scoreString = readLine(), let score = Int(scoreString) {
            students[name] = score
        } else {
            print("Invalid score. Please enter a numeric value.")
        }
    }
    gradeCalculator(students: students)
}
inputStudentGrades()



//problem 8
func isPalindrome(_ text: String) -> Bool {
    let cleanedText = text.lowercased().filter { $0.isLetter }
    return cleanedText == String(cleanedText.reversed())
}

func checkPalindrome() {
    print("Enter a string to check if it's a palindrome:")
    
    if let inputText = readLine() {
        if isPalindrome(inputText) {
            print("The input is a palindrome.")
        } else {
            print("The input is not a palindrome.")
        }
    } else {
        print("Invalid input.")
    }
}
checkPalindrome()


//problem 9
func add(_ a: Double, _ b: Double) -> Double {
    return a + b
}
func subtract(_ a: Double, _ b: Double) -> Double {
    return a - b
}
func multiply(_ a: Double, _ b: Double) -> Double {
    return a * b
}
func divide(_ a: Double, _ b: Double) -> Double? {
    return b == 0 ? nil : a / b
}
var continueCalculation = true
while continueCalculation {
    print("Enter first number:")
    if let firstNumber = Double(readLine() ?? "") {
        print("Enter second number:")
        if let secondNumber = Double(readLine() ?? "") {
            print("Choose operation (+, -, *, /):")
            if let operation = readLine() {
                switch operation {
                case "+":
                    print("Result: \(add(firstNumber, secondNumber))")
                case "-":
                    print("Result: \(subtract(firstNumber, secondNumber))")
                case "*":
                    print("Result: \(multiply(firstNumber, secondNumber))")
                case "/":
                    if let result = divide(firstNumber, secondNumber) {
                        print("Result: \(result)")
                    } else {
                        print("Error: Division by zero")
                    }
                default:
                    print("Invalid operation")
                }
            }
        }
    }

    print("Do you want to perform another calculation? (y/n)")
    continueCalculation = readLine()?.lowercased() == "y"
}


//problem 10
func uniqueCharacters(_ text: String) -> Bool {
    var seenCharacters: Set<Character> = []
    
    for char in text {
        if seenCharacters.contains(char) {
            return false
        }
        seenCharacters.insert(char)
    }
    
    return true
}

func uniqueCharactersFromInput() {
    print("Please, enter a string!:")
    
    if let inputText = readLine() {
        if uniqueCharacters(inputText) {
            print("Unique characters!")
        } else {
            print("Duplicate characters!")
        }
    } else {
        print("Input is not valid!")
    }
}
uniqueCharactersFromInput()
