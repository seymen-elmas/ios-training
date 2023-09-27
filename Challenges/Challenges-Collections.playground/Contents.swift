import UIKit

//CHALLENGE 1 : Count the numbers
extension Collection where Iterator.Element == Int{
    func challenge1a(count : Character)-> Int{
        var total = 0
        for item in self {
        
                 let str = String(item)
                 
                 for letter in str {
                    if letter == count {
                       total += 1
                        
                            }
                     
                       }
            
                  }
              return total
         }
}
 //other solution
extension Collection where Iterator.Element == Int{
    func challenge1b(count: Character) -> Int {
        return self.reduce(0) {
            $0 + String($1).filter { (char: Character) -> Bool in
                char == count }.count
        } }
}
//CHALLENGE 2 : Find N Smallest
extension Collection where Iterator.Element: Comparable {
   func challenge2(count: Int) -> [Iterator.Element] {
      let sorted = self.sorted()
      return Array(sorted.prefix(count))
   }
}

// CHALLENGE 3 :Sorting array by length
extension Collection where Iterator.Element == String {
   func challenge3() -> [String] {
      return self.sorted { $0.count > $1.count }
   }
}
//CHALLENGE 4 : Missing numbers in array
func challenge4a(input: [Int]) -> [Int] {
   let correctArray = Array(1...100)
   var missingNumbers = [Int]()
   for number in correctArray {
      if !input.contains(number) {
         missingNumbers.append(number)
      }
}
   return missingNumbers
}
//other solution
func challenge4b(input:[Int])-> [Int]{
    let correctArray = Array(1...100)
       let inputSet = Set(input)
       var missingNumbers = [Int]()
    for number in correctArray{
        if !inputSet.contains(number) {
            missingNumbers.append(number)
        }
    }
    return missingNumbers
}
//other solution
func challenge4c(input: [Int]) -> [Int] {
   let inputSet = Set(input)
   let testSet = Set(1...100)
   return Array(testSet.subtracting(inputSet)).sorted()
}
//CHALLENGE 5 : Find the median
extension Collection where Iterator.Element == Int {
   func challenge5() -> Double? {
      guard count != 0 else { return nil }
      let sorted = self.sorted()
      let middle = sorted.count / 2
      if sorted.count % 2 == 0 {
         return Double(sorted[middle] + sorted[middle - 1]) / 2
      } else {
          return Double(sorted[middle])
          
      }
    }
}
//CHALLENGE 6 : Recrate index of
extension Collection where Iterator.Element: Equatable {
   func challenge6(firstIndexOf search: Iterator.Element) ->
Int? {
      for (index, item) in self.enumerated() {
         if item == search {
            return index
} }
return nil }
}
//CHALLENGE 7 : Linked List
class LinkedListNode<T> {
    var value: T
    var next: LinkedListNode?
    init(value: T) {
        self.value = value
    }
}
class LinkedList<T> {
   var start: LinkedListNode<T>?
    func printNodes() {
         var currentNode = start
         while let node = currentNode {
            print(node.value, terminator: " ")
            currentNode = node.next
        }
        
    }
}
// for example
var list = LinkedList<Character>()
var previousNode: LinkedListNode<Character>? = nil
for letter in "abcdefghijklmnopqrstuvwxyz" {
   let node = LinkedListNode(value: letter)
   if let predecessor = previousNode {
      predecessor.next = node
} else {
    list.start = node
    
    }
previousNode = node
    
}
list.printNodes()
//CHALLENGE 8 : Linked list mid-point
var centerNode: LinkedListNode<T>? {
   var slow = start
   var fast = start
   while fast != nil && fast?.next != nil {
      slow = slow?.next
      fast = fast?.next?.next
}
return slow
    
}
// CHALLENGE 9 :Traversing the tree
func traverse(_ body: (Node<T>) -> Void) {
   left?.traverse(body)
   body(self)
   right?.traverse(body)
}
//CHALLENGE 10 : Recreate map()
extension Collection {
    func challenge10<T>(_ transform: (Iterator.Element) throws -> T) rethrows -> [T]{
        var returnValue = [T]()
        for item in self {
                 returnValue.append(try transform(item))
        }
        return returnValue
    }
}
    
// CHALLENGE 11 : Recreate min()
extension Collection where Iterator.Element: Comparable {
   func challenge11a() -> Iterator.Element? {
      var lowest: Iterator.Element?
      for item in self {
         if let unwrappedLowest = lowest {
            if item < unwrappedLowest {
               lowest = item
}
} else {
            lowest = item
         }
}
      return lowest
   }
    //other solution
    func challenge11b() -> Iterator.Element? {
       guard var lowest = self.first else { return nil }
       for item in self {
          if item < lowest {
             lowest = item
          }
    }
       return lowest
    }
    //other solution
    func challenge11c() -> Iterator.Element? {
       var it = makeIterator()
       guard var lowest = it.next() else { return nil }
       while let item = it.next() {
          if item < lowest {
             lowest = item
          }
    }
       return lowest
    }
    //short solution
    func challenge11d() -> Iterator.Element? {
       guard let lowest = self.first else { return nil }
       return reduce(lowest) { $1 < $0 ? $1 : $0 }
    }
}

//CHALENNGE 12 :impletement a deque data stucrutrue
struct deque<T> {
   private var array = [T]()
   var count: Int {
      return array.count
}
   mutating func pushBack(_ obj: T) {
      array.append(obj)
}
    mutating func pushFront(_ obj: T) {
        array.insert(obj, at: 0)
    }
       mutating func popBack() -> T? {
          return array.popLast()
    }
       mutating func popFront() -> T? {
          if array.isEmpty {
             return nil
          } else {
             return array.removeFirst()
          }
    }
    
}


//CHALLENGE 18 :Binary search trees
class Node<T> {
   var key: T
   var left: Node<T>?
   var right: Node<T>?
   init(key: T) {
      self.key = key
} }
class BinarySearchTree<T: Comparable> {
   var root: Node<T>?
    init(array: [T]) {
       for item in array {
        var placed = false
         if let rootNode = root {
          var tracker = rootNode
            while placed == false {
             if item <= tracker.key {
                if tracker.left == nil {
                    tracker.left = Node(key: item)
                    placed = true
                            }
                    tracker = tracker.left!
                        }else{
                        if tracker.right == nil {
                          tracker.right = Node(key: item)
                          placed = true
                            }
                            tracker = tracker.right!
                                        }
                            }
                            } else {
                                     root = Node(key: item)
                                  }
                    }
        
    }
                        
}
var description: String {
   guard let first = root else { return "(Empty)" }
   var queue = [Node<T>]()
   queue.append(first)
   var output = ""
   while queue.count > 0 {
      var nodesAtCurrentLevel = queue.count
      while nodesAtCurrentLevel > 0 {
         let node = queue.removeFirst()
         output += "\(node.key) "
         if node.left != nil { queue.append(node.left!) }
         if node.right != nil { queue.append(node.right!) }
         nodesAtCurrentLevel -= 1
      }
       output += "\n"
       }
       return output
    }
func isBalanced() -> Bool {
   func minDepth(from node: Node<T>?) -> Int {
      guard let node = node else { return 0 }
      let returnValue = 1 + min(minDepth(from: node.left),
minDepth(from: node.right))
      print("Got min depth \(returnValue) for \(node.key)")
      return returnValue
   }
   func maxDepth(from node: Node<T>?) -> Int {
      guard let node = node else { return 0 }
      let returnValue = 1 + max(maxDepth(from: node.left),
maxDepth(from: node.right))
      print("Got max depth \(returnValue) for \(node.key)")
      return returnValue
   }
   guard let root = root else { return true }
   let difference = maxDepth(from: root) - minDepth(from: root)
   return difference <= 1
}

