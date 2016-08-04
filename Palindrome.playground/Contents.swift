//: Playground - Palindrome

import UIKit

func executionTimeInterval(block: () -> ()) -> CFTimeInterval {
    let start = CACurrentMediaTime()
    block();
    let end = CACurrentMediaTime()
    return end - start
}

extension String {
    var isPalindrome: Bool {
        let count = self.characters.count
        
        let split = Int(count/2)
        let splitOdd = count % 2 == 0 ? 0 : 1
        
        let firstIndex = self.index(self.startIndex, offsetBy: split)
        let firstHalf = self[self.startIndex...self.index(before: firstIndex)].lowercased()
        
        let secondIndex = self.index(self.startIndex, offsetBy: split + splitOdd)
        let secondHalf = String(self[secondIndex...self.index(before: self.endIndex)].lowercased().characters.reversed())
        
        if firstHalf == secondHalf {
            return true
        }
        
        return false
    }
    
    var isFasterPalindrome: Bool {
        let count = self.characters.count
        
        let split = Int(count/2)
        let splitOdd = count % 2 == 0 ? 0 + split : 1 + split
        
        let tmp = Array(self.characters)[splitOdd...self.characters.count-1]
        
        firstArray: for char in Array(self.characters)[0...split-1].enumerated() {
            for revchar in tmp.enumerated().reversed() {
                
                if char.1 != revchar.1 {
                    return false
                } else {
                    break firstArray
                }
            }
        }
        
        return true
        
    }
}

executionTimeInterval {
    let test = "adda"
    test.isPalindrome
}

executionTimeInterval {
    let test = "adda"
    test.isFasterPalindrome
}


executionTimeInterval {
    let test = "supercalifragilistichespiralidoso"
    test.isPalindrome
}

executionTimeInterval {
    let test = "supercalifragilistichespiralidoso"
    test.isFasterPalindrome
}


executionTimeInterval {
    let test = "saippuakivikauppias"
    test.isPalindrome
}

executionTimeInterval {
    let test = "saippuakivikauppias"
    test.isFasterPalindrome
}

executionTimeInterval {
    let test = "step on no pets"
    test.isPalindrome
}

executionTimeInterval {
    let test = "step on no pets"
    test.isFasterPalindrome
}
