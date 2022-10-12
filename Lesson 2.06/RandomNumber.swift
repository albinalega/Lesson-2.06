//
//  RandomNumber.swift
//  Lesson 2.06
//
//  Created by Альбина Лега on 12/10/2022.
//

import Foundation

struct RandomNumber {
    var minimumValue: Int
    var maximumValue: Int
    
    var getRandom: Int {
        Int.random(in: minimumValue...maximumValue)
    }
}
