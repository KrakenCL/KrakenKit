/* Copyright 2018 The KrakenCL Authors. All Rights Reserved.
 
 Created by Volodymyr Pavliukevych
 
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 
 http://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

import Foundation
import Proto

/// Returns an iterator pointing to the first element in the range [first, last) that is greater than value, or last if no such element is found.
extension Array where Element: Comparable {
    public func upperBound(value: Element) -> Index {
        var lowIndex = startIndex
        var highIndex = endIndex - 1
        var middleIndex = lowIndex + (highIndex - lowIndex) / 2
        
        while lowIndex <= highIndex {
            let middleValue = self[middleIndex]

            if value >= middleValue  {
                lowIndex = middleIndex
                middleIndex = lowIndex + (highIndex - lowIndex) / 2
                if middleIndex == lowIndex {
                    return highIndex
                }
                continue
            } else { //clear
                highIndex = middleIndex
                middleIndex = lowIndex + (highIndex - lowIndex) / 2
                if highIndex == middleIndex {
                    return highIndex
                }
                continue
            }
        }
        return highIndex
    }
}

internal class Histogram {
    
    var bucketLimit: [Double]
    var bucket: [Int]
    var min: Double = 0.0
    var max: Double = 0.0
    var count: Int = 0
    var sum: Double = 0.0
    var sumOfSquares: Double = 0.0
    
    init(ofSequence sequence: [Double]) {
        bucketLimit = Histogram.defaultBuckets
        bucket = Array<Int>(repeating: 0, count: bucketLimit.count)
        for element in sequence {
            add(value: element)
        }
    }
    
    fileprivate static var defaultBuckets: [Double] {
        var buckets = [Double]()
        var negativeBuckets = [Double]()

        var norm: Double = Double.leastNormalMagnitude
        while norm < Double.greatestFiniteMagnitude {
            buckets.append(norm)
            negativeBuckets.append(-norm)
            norm *= 1.1
        }
        return negativeBuckets.reversed() + [0.0] + buckets
    }
    
    fileprivate func add(value: Double) {
        let bucketIndex = bucketLimit.upperBound(value: value)
        bucket[bucketIndex] = bucket[bucketIndex] + 1
        
        if min > value { min = value }
        if max < value { max = value }
        
        count += 1
        sum += value
        sumOfSquares += (value * value)
    }
    
    /// Find run of empty buckets and collapse them into one
    fileprivate func scour() {
        var index = 0
        var scouredBucket = [Int]()
        var scouredBucketLimits = [Double]()
        while index < bucket.count {
            var end = bucketLimit[index]
            var count = bucket[index]
            index += 1
            if count == 0 {
                while index < bucket.count && bucket[index] == 0 {
                    end = bucketLimit[index]
                    count = bucket[index]
                    index += 1
                }
            }
            scouredBucket.append(count)
            scouredBucketLimits.append(end)
        }
        bucket = scouredBucket
        bucketLimit = scouredBucketLimits
    }
    
    lazy var proto: Tensorflow_HistogramProto = {
        // Find run of empty buckets and collapse them into one
        scour()
        var histogramProto = Tensorflow_HistogramProto()
        histogramProto.bucket = bucket.map { Double($0) }
        histogramProto.bucketLimit = bucketLimit
        histogramProto.max = max
        histogramProto.min = min
        histogramProto.num = Double(count)
        histogramProto.sum = sum
        histogramProto.sumSquares = sumOfSquares
        return histogramProto
    }()
}
