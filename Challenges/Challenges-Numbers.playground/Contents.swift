import UIKit

//CHALLENGE 1 : Fizz Buzz
func challenge1a(){
    for i in 1...100{
        if i % 3 == 0 && i % 5 == 0 {
            print("FizzBuzz")
        }
        else if i % 5 == 0 {
            print("Buzz")
        }
        else if i % 3 == 0 {
            print("Fizz")
        }
        else{
           print(i)
        }
        
    }
}
// other solution
func challenge1b() {
   for i in 1...100 {
      if i % 3 == 0 {
         if i % 5 == 0 {
            print("Fizz Buzz")
         } else {
            print("Fizz")
         }
      } else if i % 5 == 0 {
         print("Buzz")
      } else {
             print(i)
          
         }
     }
    
}
// short soltiuon
func challenge1c() {
   (1...100).forEach {
      print($0 % 3 == 0 ? $0 % 5 == 0 ? "Fizz Buzz" : "Fizz" :
$0 % 5 == 0 ? "Buzz" : "\($0)") }
}
//CHALLENGE 2 : Generate a Random Number
func challenge2a(min: Int, max: Int) -> Int {
   return Int.random(in: min...max)
}
//other solution
func challenge2b(min: Int, max: Int) -> Int {
   return Int(arc4random_uniform(UInt32(max - min + 1))) + min
}
// CHALLENGE 3 : Recreate the Pow func
func challenge3a(num:Int,pow:Int)-> Int{
    guard num > 0, pow > 0 else { return 0 }
       var returnValue = num
       for _ in 1..<pow {
          returnValue *= num
    }
       return returnValue
    
}
// other solution
func challenge3b(number: Int, power: Int) -> Int {
    guard number > 0, power > 0 else { return 0 }
    if power == 1 { return number }
    return number * challenge3b(number: number, power: power -
 1)
 }
//CHALLENGE 4 : Swap numbers
func challenge4(first:Int,second:Int)-> [Int]{
    var value = [first,second]
    print(value)
   var value2 = [second,first]
    print(value2)
    return value
}
//CHALLENGE 5 : Number is Prime
func challenge5a(number: Int) -> Bool {
   guard number >= 2 else { return false }
   for i in 2 ..< number {
      if number % i == 0 {
         return false
      }
}
return true }
//other solution
func challenge5b(number: Int) -> Bool {
   guard number >= 2 else { return false }
   guard number != 2 else { return true }
   let max = Int(ceil(sqrt(Double(number))))
   for i in 2 ... max {
      if number % i == 0 {
         return false
      }
}
return true }
//CHALLENGE 6 : Counting Binary ones
func challenge6a(number: Int) -> (nextHighest: Int?,
nextLowest: Int?) {
   let targetBinary = String(number, radix: 2)
   let targetOnes = targetBinary.filter { (char: Character) ->
Bool in char == "1" }.count
   var nextHighest: Int? = nil
   var nextLowest: Int? = nil
   for i in number + 1...Int.max {
      let currentBinary = String(i, radix: 2)
      let currentOnes = currentBinary.filter { (char:
Character) -> Bool in char == "1" }.count
if targetOnes == currentOnes {
         nextHighest = i
         break
} }
   for i in (0 ..< number).reversed() {
      let currentBinary = String(i, radix: 2)
      let currentOnes = currentBinary.filter { (char:
Character) -> Bool in char == "1" }.count
      if targetOnes == currentOnes {
         nextLowest = i
         break
} }
   return (nextHighest, nextLowest)
}
//other solution:
func challenge6b(number: Int) -> (nextHighest: Int?,
                                   nextLowest: Int?) {
    func ones(in number: Int) -> Int {
        let currentBinary = String(number, radix: 2)
        return currentBinary.filter { (char: Character) -> Bool
            in char == "1" }.count
    }
    let targetOnes = ones(in: number)
       var nextHighest: Int? = nil
       var nextLowest: Int? = nil
       for i in number + 1...Int.max {
          if ones(in: i) == targetOnes {
             nextHighest = i
    break
    } }
       for i in (0 ..< number).reversed() {
          if ones(in: i) == targetOnes {
             nextLowest = i
    break
    } }
       return (nextHighest, nextLowest)
    }
//CHALLENGE 7 : Binary Reverse
func challenge7(number: UInt) -> UInt {
   let binary = String(number, radix: 2)
   let paddingAmount = 8 - binary.count
   let paddedBinary = String(repeating: "0", count:
paddingAmount) + binary
   let reversedBinary = String(paddedBinary.reversed())
   return UInt(reversedBinary, radix: 2)!
}
//CHALLENGE 8 : Integer Disguisted as string
func challenge8a(input: String) -> Bool {
   return UInt(input) != nil
}
//other solution (long)
func challenge8b(input: String) -> Bool {
   for letter in input {
      if Int(String(letter)) == nil {
         return false
}
       
   }
return true
    
}
//other solution
func challenge8c(input: String) -> Bool {
   return input.rangeOfCharacter(from:
CharacterSet.decimalDigits.inverted) == nil
}
//other solution
func challenge8d(input: String) -> Bool {
   return input.rangeOfCharacter(from:
CharacterSet(charactersIn: "0123456789").inverted) == nil
}
// CHALLENGE 9 : Add numbers inside a string
func challenge9a(string:String)-> Int{
    var currentNumber = ""
    var sum = 0
    for letter2 in string{
        let strLetter = String(letter2)
              if Int(strLetter) != nil {
                  currentNumber += strLetter
                     } else {
                        sum += Int(currentNumber) ?? 0
                        currentNumber = ""
                     }
               }
                  sum += Int(currentNumber) ?? 0
               return sum
    
}
//other solution
func challenge9b(string: String) -> Int {
   let regex = try! NSRegularExpression(pattern: "(\\d+)",
options: [])
   let matches = regex.matches(in: string, options: [], range:
NSRange(location: 0, length: string.utf16.count))
   let allNumbers = matches.compactMap { Int((string as
NSString).substring(with: $0.range)) }
   return allNumbers.reduce(0, +)
}
//CHALLENGE 10 : Calculate a square root
func challenge10a(input: Int) -> Int {
   guard input != 1 else { return 1 }
   for i in 0 ... input / 2 + 1 {
      if i * i > input {
return i - 1 }
}
return 0 }
//other solution (longversion)
func challenge10b(input: Int) -> Int {
    guard input != 1 else { return 1 }
    var lowerBound = 0
    var upperBound = 1 + input / 2
    while lowerBound + 1 < upperBound {
          let middle = lowerBound + ((upperBound - lowerBound) / 2)
          let middleSquared = middle * middle
          if middleSquared == input {
             return middle
                 } else if middleSquared < input {
             lowerBound = middle
                   }else {
             upperBound = middle
           }
        
       }
       return lowerBound
    }
// other solution (short version)
func challenge10c(input: Int) -> Int {
   return Int(floor(pow(Double(input), 0.5)))
}
//CHALLENGE 11 : Subtrackt without subtrackt
func challenge11a(subtract: Int, from: Int) -> Int {
   return from + -subtract
}
// other solution
func challenge11b(subtract: Int, from: Int) -> Int {
   return from + -1 * subtract
}
//other solution
func challenge26c(subtract: Int, from: Int) -> Int {
   return from + (~subtract + 1)
}

