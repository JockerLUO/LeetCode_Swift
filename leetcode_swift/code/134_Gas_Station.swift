//
//  134_Gas_Station.swift
//  leetcode_swift
//
//  Created by jocker luo on 2022/6/9.
//

import Foundation

extension Solution {
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        var rest = 0, run = 0, start = 0
        for i in 0..<gas.count {
            run += (gas[i] - cost[i])
            rest += (gas[i] - cost[i])
            if (run < 0){
                start = i + 1
                run = 0
            }
        }
        return rest < 0 ? -1: start
    }
    
//    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
//        var index = 0
//        repeat {
//            if _canCompleteCircuit(index, gas, cost) {
//                return index
//            } else {
//                repeat {
//                    if index == gas.count - 1 {
//                        return -1
//                    } else {
//                        index += 1
//                    }
//                } while gas[index] == cost[index]
//            }
//        } while index != 0
//        return -1
//    }
//
//    private func _canCompleteCircuit(_ index: Int, _ gas: [Int], _ cost: [Int]) -> Bool {
//        var carG = 0
//        var offset = index
//        repeat {
//            carG += gas[offset]
//            carG -= cost[offset]
//            if carG >= 0 {
//                if offset == gas.count - 1 {
//                    offset = 0
//                } else {
//                    offset += 1
//                }
//            } else {
//                return false
//            }
//        } while offset != index
//        return true
//    }
}
