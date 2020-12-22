//
//  ValueGenerator.swift
//  GraphApp
//
//  Created by Angel Hernández on 12/17/20.
//

import Foundation

public class ValueGenerator {
    
    //Generate random values
    static func generateRandomIntValues(bottomLimit: Int, topLimit: Int, numberOfItems: Int) -> [Int] {
        var items:[Int] = []
        for _ in 0..<numberOfItems {
            items.append(Int.random(in: bottomLimit..<topLimit))
        }
        
        return items
    }
    
    //Generate random values separating the last value from the next one by a range between 1 and 20
    static func generateOrderedIntValues(bottomLimit: Int, topLimit: Int, numberOfItems: Int) -> [Int] {
        var items:[Int] = []
        for _ in 0..<numberOfItems {
            if let lastValue = items.last {
                var randomValue = Int.random(in: (lastValue - 20)..<(lastValue + 20))
                while randomValue < bottomLimit || randomValue > topLimit {
                    randomValue = Int.random(in: (lastValue - 20)..<(lastValue + 20))
                }
                items.append(randomValue)
                continue
            }
            
            items.append(Int.random(in: bottomLimit..<topLimit))
        }
        
        return items
    }
}
