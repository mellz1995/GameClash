//
//  ShapeType.swift
//  Game Clash
//
//  Created by Melvin Corners on 1/5/17.
//  Copyright © 2017 Melvin Corners. All rights reserved.
//

import Foundation

//Creates a new public enum ShapeType that enumerates the various shapes
public enum ShapeType: Int {
    
    case Box = 0
    case Shpere
    case Pyramid
    case Torus
    case Capsule
    case Cylinder
    case Cone
    case Tube
    
    //Also defines a static method random() that generates a random ShapeType
    static func random() -> ShapeType{
        let maxValue = Tube.rawValue
        let rand = arc4random_uniform(UInt32(maxValue+1))
        return ShapeType(rawValue: Int(rand))!
    }
}
