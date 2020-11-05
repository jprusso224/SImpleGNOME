//
//  TimeSignature.swift
//  SimpleGNOME
//
//  Created by John Paul Russo on 10/30/20.
//

struct TimeSignature
{
    let VALID_NUMERATORS: [Int] = Array(1...17)
    let VALID_DENOMINATORS: [Int] = [2,4,8,16]
    
    var numerator: Int = 4
    var denominator: Int = 4
}
