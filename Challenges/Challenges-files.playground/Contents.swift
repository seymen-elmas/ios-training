import UIKit

//CHALLENGE 1 : Print Last Lines
func challenge1(filename: String, lineCount: Int) {
   guard let input = try? String(contentsOfFile: filename) else
{ return }
   var lines = input.components(separatedBy: "\n")
   guard lines.count > 0 else { return }
   lines.reverse()
   var output = [String]()
    for i in 0 ..< min(lines.count, lineCount) {
        output.append(lines[i])
    }
       print(output.joined(separator: ", "))
    }
//CHALLENGE 2 : Log a message
func challenge2(log message: String, to logFile: String) {
   var existingLog = (try? String(contentsOfFile: logFile)) ??
""
existingLog.append("\(Date()): \(message)\n")
do {
   try existingLog.write(toFile: logFile, atomically: true,
encoding: .utf8)
   } catch {
      print("Failed to write to log: \(error.localizedDescription)")
}
}
//CHALLENGE 3 : Documents directory
func challenge3() -> URL {
   let paths =
FileManager.default.urls(for: .documentDirectory,
in: .userDomainMask)
   return paths[0]
}
// CHALLENGE 4 : New JPEGs
func challenge4(in directory : String) ->[String]{
    let fm = FileManager.default
       let directoryURL = URL(fileURLWithPath: directory)
       guard let files = try? fm.contentsOfDirectory(at:
    directoryURL, includingPropertiesForKeys: nil) else { return
    [] }
    var jpegs = [String]()
    for file in files {
        if file.pathExtension == "jpg" || file.pathExtension ==
            "jpeg" {
            guard let attributes = try?
                    fm.attributesOfItem(atPath: file.path) else { continue }
            guard let creationDate = attributes[.creationDate] as?
                    Date else { continue }
            if creationDate > Date(timeIntervalSinceNow: -60 * 60 * 48) {
                jpegs.append(file.lastPathComponent)
            }
        }
    }

    return jpegs
}
//CHALENGE 5 : Copy recursively
func challenge5(source: String, destination: String) -> Bool {
    let fm = FileManager.default
    var isDirectory: ObjCBool = false
    guard fm.fileExists(atPath: source, isDirectory:&isDirectory) || isDirectory.boolValue == false else { return
        false }
    let sourceURL = URL(fileURLWithPath: source)
       let destinationURL = URL(fileURLWithPath: destination)
       do {
          try fm.copyItem(at: sourceURL, to: destinationURL)
       } catch {
          print("Copy failed: \(error.localizedDescription)")
          return false
    }
    return true
    
    
}
//CHALLENGE 6: Word frequency
func challenge6(filename: String, count: String) -> Int {
   guard let inputString = try? String(contentsOfFile:
filename) else { return 0 }
   var nonletters = CharacterSet.letters.inverted
   nonletters.remove("'")
   let allWords = inputString.components(separatedBy:
nonletters)
   let wordsSet = NSCountedSet(array: allWords)
   return wordsSet.count(for: count)
}
//CHALLENGE 7 : Find duplicate filename
func challenge7(in directory: String) -> [String] {
   let fm = FileManager.default
   let directoryURL = URL(fileURLWithPath: directory)
   guard let files = fm.enumerator(at: directoryURL,
includingPropertiesForKeys: nil) else { return [] }
   var duplicates = Set<String>()
   var seen = Set<String>()
   for case let file as URL in files {
      guard file.hasDirectoryPath == false else { continue }
      let filename = file.lastPathComponent
      if seen.contains(filename) {
         duplicates.insert(filename)
}
      seen.insert(filename)
   }
   return Array(duplicates)
}
// CHALLENGE 8 :Find Executables
func challenge8(in directory: String) -> [String] {
   let fm = FileManager.default
   let directoryURL = URL(fileURLWithPath: directory)
   guard let files = try? fm.contentsOfDirectory(at:
directoryURL, includingPropertiesForKeys: nil) else { return
[] }
   var returnValue = [String]()
   for file in files {
      guard file.hasDirectoryPath == false else { continue }
      if fm.isExecutableFile(atPath: file.path) {
         returnValue.append(file.lastPathComponent)
} }
   return returnValue
}
// CHALLENGE 9 : Convert images
func challenge9(in directory: String){
       let fm = FileManager.default
       let directoryURL = URL(fileURLWithPath: directory)
       guard let files = try? fm.contentsOfDirectory(at:
    directoryURL, includingPropertiesForKeys: nil) else { return }
       for file in files {
          guard file.pathExtension == "jpeg" || file.pathExtension
    == "jpg" else { continue}
          guard let image = UIImage(contentsOfFile: file.path) else
    { continue }
          guard let png = image.pngData() else { continue }
          let newFilename =
    file.deletingPathExtension().appendingPathExtension("png")
          _ = try? png.write(to: newFilename)
       }
    
}
//CHALLENGE 10 : Print error lines
class ChunkedFileReader {
   var fileHandle: FileHandle?
   var buffer: Data
   let chunkSize: Int = 4
   let delimiter = "\n".data(using: .utf8)!
   init(path: String) {
      fileHandle = FileHandle(forReadingAtPath: path)
      buffer = Data(capacity: chunkSize)
}
   func readLine() -> String? {
      
      var rangeOfDelimiter = buffer.range(of: delimiter)
      
      while rangeOfDelimiter == nil {
         
         guard let chunk = fileHandle?.readData(ofLength:
chunkSize) else { return nil }
         if chunk.count == 0 {
            
            if buffer.count > 0 {
                              defer { buffer.count = 0 }
               return String(data: buffer, encoding: .utf8)
            }
            
            return nil
         } else {
           
            buffer.append(chunk)
            
            rangeOfDelimiter = buffer.range(of: delimiter)
         }
}
     
      let rangeOfLine = Range(0 ..<
rangeOfDelimiter!.upperBound)
      
      let line = String(data: buffer.subdata(in: rangeOfLine),
encoding: .utf8)
      
      buffer.removeSubrange(rangeOfLine)
      
      line?.trimmingCharacters(in: .whitespacesAndNewlines)
   }
}
func challenge10(filename: String) -> Int {
   var totalErrors = 0
   let reader = ChunkedFileReader(path: filename)
   while let line = reader.readLine() {
      if line.hasPrefix("[ERROR]") {
         totalErrors += 1
      }
}
   return totalErrors
}
