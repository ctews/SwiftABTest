//
//  CTSplitTest.swift
//  Twitter - @ctews
//
//  Created by Christoffer Tews on 09.05.16.
//  Copyright © 2016 Christoffer Tews. All rights reserved.
//

import Foundation

struct CTSplitTest {

    typealias SplitGroup = () -> Void

    func runABTest(distribution:[Double]=[0.5,0.5], groupA:ReferralGroup?, groupB:ReferralGroup?) {
        let rnd = self._randomNumber(probabilities: distribution)

        if rnd == 0 {
            groupA?()
        } else {
            groupB?()
        }
    }

    func runABCTest(groupA groupA:SplitGroup?, groupB:SplitGroup?, groupC:SplitGroup?) {
        let rnd = self._randomNumber(probabilities: [0.33, 0.33, 0,33])

        if rnd == 0 {
            groupA?()
        } else if rnd == 1 {
            groupB?()
        } else {
            groupC?()
        }
    }

    /**
     * Create a random number with distribution
     * E.g. randomNumber([0.5,0.5]) generate a 0 or 1 with 50-50 split
     *      randomNumber([0.33,0.33,0.33]) generate 0,1,2 with a 33-33-33 split
     * Credits are going to Martin R. for that method (http://stackoverflow.com/users/1187415/martin-r)
     * Stackoverflow Explanation: http://stackoverflow.com/questions/30309556/generate-random-numbers-with-a-given-distribution
     */
    private func _randomNumber(probabilities probabilities: [Double]) -> Int {
        // Sum of all probabilities (so that we don't have to require that the sum is 1.0):
        let sum = probabilities.reduce(0, combine: +)
        // Random number in the range 0.0 <= rnd < sum :
        let rnd = sum * Double(arc4random_uniform(UInt32.max)) / Double(UInt32.max)
        // Find the first interval of accumulated probabilities into which `rnd` falls:
        var accum = 0.0
        for (i, p) in probabilities.enumerate() {
            accum += p
            if rnd < accum {
                return i
            }
        }
        // This point might be reached due to floating point inaccuracies:
        return (probabilities.count - 1)
    }

}