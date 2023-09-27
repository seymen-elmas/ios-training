import UIKit

//String Challenge 1 Duplicated
func challenge1a(input: String) -> Bool {
   var usedLetters = [Character]()
   for letter in input {
      if usedLetters.contains(letter) {
         return false
      }
      usedLetters.append(letter)
   }
return true }

func challenge1b(input: String) -> Bool {
   return Set(input).count == input.count
}


//String Challenge 2 palindrome String
func challenge2a(input: String) -> Bool {
   return String(input.reversed()) == input
}
// Turning lowercase
func challenge2b(input: String) -> Bool {
   let lowercased = input.lowercased()
   return String(lowercased.reversed()) == lowercased
}
// String Challenge 3 checking two Stings contain the same character
func challenge3a(string1: String, string2: String) -> Bool {
   var checkString = string2
   for letter in string1 {
      if let index = checkString.firstIndex(of: letter) {
         checkString.remove(at: index)
      } else {
         return false
      }
}
   return checkString.count == 0
}
// other hand
func challenge3b(string1: String, string2: String) -> Bool {
   return string1.sorted() == string2.sorted()
}
//String Challenge 4: Does one string contain another?

extension String {
   func fuzzyContains(_ string: String) -> Bool {
      return self.uppercased().range(of: string.uppercased()) != nil
        }
    }
// other solution
extension String {
   func FuzzyContains(_ string: String) -> Bool {
      return range(of: string, options: .caseInsensitive) !=
nil
} }
// STRİNG CHALLENGE 5: Count the Characters
func Challenge5a (input:String, count:Character) -> Int {
     var letterCount = 0
    for letter in input {
        if letter == count {
            letterCount = letterCount + 1
        }
    }
    return letterCount
}
 
// other solution using reduce method
func challenge5b(input: String, count: Character) -> Int {
   return input.reduce(0) {
      $1 == count ? $0 + 1 : $0
   }
}
// other solution using NSObject Method
func challenge5c(input: String, count: String) -> Int {
   let array = input.map { String($0) }
   let counted = NSCountedSet(array: array)
   return counted.count(for: count)
}
// last solution is short solution modifying object
func challenge5d(input: String, count: String) -> Int {
   let modified = input.replacingOccurrences(of: count, with:
"")
   return input.count - modified.count
}
// STRING CHALLENGE 6 : Remove duplicate letters from a string (example input : hello -> output : helo)

func challenge6a(string: String) -> String {
   let array = string.map { String($0) }
   let set = NSOrderedSet(array: array)
   let letters = Array(set) as! Array<String>
   return letters.joined()
}
//other solution
func challenge6b(string: String) -> String {
   var used = [Character]()
   for letter in string {
      if !used.contains(letter) {
         used.append(letter)
      }
}
   return String(used)
}
// other solution
func challenge6c(string: String) -> String {
   var used = [Character: Bool]()
    let result = string.filter {
        used.updateValue(true, forKey: $0) == nil
    }
       return String(result)
    }
//CHALLENGE 7 : Condense whitespace

func challenge7(input: String) -> String {
   let components =
input.components(separatedBy: .whitespacesAndNewlines)
   return components.filter { !$0.isEmpty }.joined(separator: "")
                                                   
}
// other solution
func challenge7a(input: String) -> String {
   var seenSpace = false
   var returnValue = ""
   for letter in input {
      if letter == " " {
         if seenSpace { continue }
         seenSpace = true
      } else {
          seenSpace = false
              }
            returnValue.append(letter)
         }
         return returnValue
      }
// other solution
func challenge7b(input: String) -> String {
   return input.replacingOccurrences(of: " +", with: " ",
options: .regularExpression, range: nil)
}
//CHALLENGE 8: String is Rotated
func challenge8a(input: String, rotated: String) -> Bool {
   let combined = input + input
   return combined.contains(rotated)
}
//other solution
func challenge8b(input: String, rotated: String) -> Bool {
   guard input.count == rotated.count else { return false }
   let combined = input + input
   return combined.contains(rotated)
}

//CHALLENGE 9 : Find Panagram
func challenge9(input: String) -> Bool {
   let set = Set(input.lowercased())
   let letters = set.filter { $0 >= "a" && $0 <= "z" }
   return letters.count == 26
}
//CHALLENGE 10 : Vovels and Consonants
func challenge10a(input: String) -> (vowels: Int, consonants:
Int) {
   let vowels = CharacterSet(charactersIn: "aeiou")
   let consonants = CharacterSet(charactersIn:
"bcdfghjklmnpqrstvwxyz")
   var vowelCount = 0
   var consonantCount = 0
   for letter in input.lowercased() {
      let stringLetter = String(letter)
      if stringLetter.rangeOfCharacter(from: vowels) != nil {
         vowelCount += 1
      } else if stringLetter.rangeOfCharacter(from:
consonants) != nil {
         consonantCount += 1
      }
}
   return (vowelCount, consonantCount)
}
// other solution
func challenge10b(input: String) -> (vowels: Int, consonants:
Int) {
   let vowels = "aeiou"
   let consonants = "bcdfghjklmnpqrstvwxyz"
   var vowelCount = 0
   var consonantCount = 0
   for letter in input.lowercased() {
      let stringLetter = String(letter)
      if vowels.contains(stringLetter) {
         vowelCount += 1
      } else if consonants.contains(stringLetter) {
         consonantCount += 1
} }
   return (vowelCount, consonantCount)
}
//other solution
func challenge10c(input: String) -> (vowels: Int, consonants:
Int) {
   let vowels = "aeiou"
   let consonants = "bcdfghjklmnpqrstvwxyz"
   var vowelCount = 0
   var consonantCount = 0
    for letter in input.lowercased() {
      if vowels.contains(letter) {
         vowelCount += 1
      } else if consonants.contains(letter) {
         consonantCount += 1
      }
}
   return (vowelCount, consonantCount)
}

// CHALLENGE 11 : Three Different Letters
func challenge11(first: String, second: String) -> Bool {
   guard first.count == second.count else { return false }
   let firstArray = Array(first)
   let secondArray = Array(second)
   var differences = 0
   for (index, letter) in firstArray.enumerated() {
      if secondArray[index] != letter {
         differences += 1
       if differences == 4 {
            return false
} }
}
return true }

//CHALLENGE 12 : Find Longest prefix
func challenge12(input: String) -> String {
   let parts = input.components(separatedBy: " ")
   guard let first = parts.first else { return "" }
   var currentPrefix = ""
   var bestPrefix = ""
   for letter in first {
      currentPrefix.append(letter)
      for word in parts {
         if !word.hasPrefix(currentPrefix) {
            return bestPrefix
         }
}
      bestPrefix = currentPrefix
   }
   return bestPrefix
}
//CHALLENGE 13 :Run Length encoding
func challenge13a(input: String) -> String {
   var currentLetter: Character?
   var returnValue = ""
   var letterCounter = 0
   for letter in input {
      if letter == currentLetter {
         letterCounter += 1
      } else {
         if let current = currentLetter {
            returnValue.append("\(current)\(letterCounter)")
}
currentLetter = letter
         letterCounter = 1
      }
}
   if let current = currentLetter {
      returnValue.append("\(current)\(letterCounter)")
}
   return returnValue
}
// other solution
func challenge13b(input: String) -> String {
   var returnValue = ""
   var letterCounter = 0
   var letterArray = Array(input)
   for i in 0 ..< letterArray.count {
      letterCounter += 1
      if i + 1 == letterArray.count || letterArray[i] !=
letterArray[i + 1] {
         returnValue += "\(letterArray[i])\(letterCounter)"
letterCounter = 0
      }
}
   return returnValue
}
//CHALLENGE 14 : String Permutation
func challenge14(string: String, current: String = "") {
   let length = string.count
   let strArray = Array(string)
    if (length == 0) {
        print(current)
              print("******")
           } else {
              print(current)
              for i in 0 ..< length {
             
                 let left = String(strArray[0 ..< i])
                 let right = String(strArray[i+1 ..< length])
                 challenge14(string: left + right, current: current +
        String(strArray[i]))
        } }
        }
// Challenge 15 : Reverse Words in a String
func challenge15(input: String) -> String {
   let parts = input.components(separatedBy: " ")
   let reversed = parts.map { String($0.reversed()) }
   return reversed.joined(separator: " ")
}

