//
//  RandomUserId.swift
//  A-teams test
//
//  Created by Ковалева on 03.11.17.
//  Copyright © 2017 Ковалев. All rights reserved.
//

import Foundation

extension Int {
    static func randomId(range: Range<Int> ) -> Int {
        var offset = 0
        
        if range.lowerBound < 0   {
            offset = abs(range.lowerBound)
        }
        
        let min = UInt32(range.lowerBound + offset)
        let max = UInt32(range.upperBound + offset)
        
        return Int(min + arc4random_uniform(max - min)) - offset
    }
}
