//
//  ValueGenerator.swift
//  GraphApp
//
//  Created by Angel Hernández on 12/17/20.
//

import Foundation

public class ValueGenerator {
    static func generateRandomIntValues(bottomLimit: Int, topLimit: Int, numberOfItems: Int) -> [Int] {
        var items:[Int] = []
        for _ in 0..<numberOfItems {
            items.append(Int.random(in: bottomLimit..<topLimit))
        }
        
        return items
    }
    
    static func generateOrderedIntValues(bottomLimit: Int, topLimit: Int, numberOfItems: Int) -> [Int] {
        var items:[Int] = []
        for _ in 0..<numberOfItems {
            if let lastValue = items.last {
                let randomValue = Int.random(in: (lastValue - 20)..<(lastValue + 20))
                items.append(randomValue)
                continue
            }
            
            items.append(Int.random(in: bottomLimit..<topLimit))
        }
        
        return items
    }
}
