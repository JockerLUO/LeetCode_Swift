//
//  037_Sudoku_Solver.swift
//  leetcode_swit
//
//  Created by jocker luo on 2021/10/11.
//

import Foundation

extension Solution {
    
    func solveSudoku(_ board: inout [[Character]]) {

        let base = 0b1_1111_1111 /// 2^9 - 1
        var boardMap: [[Int: Int]] = Array(repeating: [:], count: 10)
        for i in 0..<9 {
            for j in 0..<9 {
                boardMap[9][i * 10 + j] = base
            }
        }
        for (i, ls) in board.enumerated() {
            for (j, char) in ls.enumerated() {
                if char == "." {
                    continue
                }
                let res = fill(boardMap: &boardMap, num: char.wholeNumberValue!, tIndex: i * 10 + j)
                if res == false {
                    print("数组错误,不是一个有效的数独")
                    return
                }
            }
        }

//        testBoardMap(boardMap)
        let val = tryFill(boardMap)
        for (index, num) in val.1 {
            board[index / 10][index % 10] = Character("\(num)")
        }

//        let res = isValidSudoku(board)
//        print("-----------------------")
//
//        var count = 0
//        for (_, v) in boardMap.enumerated() {
//            count += v.count
//        }
//
//        print(res, val.0, val.1.count == count)
//        for ls in board {
//            print(ls)
//        }
    }

    private func tryFill(_ boardStack: [[Int: Int]]) -> (Bool, [Int: Int]) {

        var result = [Int: Int]()
        var boardMap = boardStack
        while boardMap[1].count > 0 {
            let index = boardMap[1].keys.first!
            let num = sudokuMap(bitNum: boardMap[1].values.first!).first!
            let res = fill(boardMap: &boardMap, num: num, tIndex: index)
            if res == false {
                return (false, result)
            } else {
                result[index] = num
            }
        }

        var item: (Int, [Int])?
        for i in 2..<boardMap.count {
            if !boardMap[i].isEmpty {
                let indexs = boardMap[i].keys.sorted(by: < )
                let index = indexs.first!
                let num = boardMap[i][index]!
                item = (index, sudokuMap(bitNum: num))
                break
            }
        }

        if let item = item {
            let index = item.0
            let nums = item.1
            for (i, num) in nums.enumerated() {
                var boardMapC = boardMap
                if fill(boardMap: &boardMapC, num: num, tIndex: index) { ///失败触发回溯
                    let res = tryFill(boardMapC)
                    if res.0 {
                        result.merge(res.1) { (_, new) in new }
                        result[index] = num
                        return (true, result)
                    }
                }
                if i == nums.count - 1 {
                    return (false, result)
                }
            }
        }
        return (true, result)
    }

    private func fill(boardMap: inout [[Int: Int]], num: Int, tIndex: Int) -> Bool {
        let row = tIndex / 10
        let column = tIndex % 10
        let bRow = (row - row % 3)
        let bColumn = (column - column % 3)

        var moveList = [Int: Int]()
        let bitKey = sudokuMap(num: num)

        for (i, dic) in boardMap.enumerated() {
            for (key, num) in dic {
                let curRow = key / 10, curColumn = key % 10
                let inBlock = (curRow >= bRow && curRow < bRow + 3 && curColumn >= bColumn && curColumn < bColumn + 3)
                if curRow == row || curColumn == column || inBlock {
                    let val = num & bitKey ///通过"与"运算,判断是否包含相应数
                    if val != 0 {
                        moveList[key] = i
                        boardMap[i][key] = num & (~bitKey)  ///先取"反",再通过"与"运算改变格子状态
                        if key == tIndex { ///当前填的格子不用判断
                            continue
                        }
                        if boardMap[i][key] == 0 { ///有一个格子无法填入任何数字,代表失败
                            return false
                        }
                    }
                }
            }
        }
        for (key, index) in moveList {
            let num = boardMap[index].removeValue(forKey: key)!
            if key != tIndex {
                let bitCount = num.nonzeroBitCount ///偷懒,使用api,计算当前格子可以填入几个数字
                boardMap[bitCount][key] = num
            }
        }
        return true
    }

    static let sudokuMaping: [Int: Int] = [
        1: 0b000000001,
        2: 0b000000010,
        3: 0b000000100,
        4: 0b000001000,
        5: 0b000010000,
        6: 0b000100000,
        7: 0b001000000,
        8: 0b010000000,
        9: 0b100000000,
    ]

    private func sudokuMap(num: Int) -> Int {
        return Self.sudokuMaping[num] ?? 0
    }

    private func sudokuMap(bitNum: Int) -> [Int] {
        var res = [Int]()
        for i in 1...9 {
            if bitNum & Self.sudokuMaping[i]! != 0 {
                res.append(i)
            }
        }
        return res
    }

    private func testBoardMap(_ boardMap: [[Int: Int]], pre: String = "") {
        for (i, dic) in boardMap.enumerated() {
            let indexs = boardMap[i].keys.sorted(by: < )
            var log = "(\(i))"
            for j in indexs {
                log.append(" \(j):\(sudokuMap(bitNum: dic[j]!))")
            }
            print(log)
        }
    }
    
//    func solveSudoku(_ board: inout [[Character]]) {
//        var boardMap = Array(repeating: [Int: [Int]](), count: 10)
//        for i in 0..<9 {
//            for j in 0..<9 {
//                boardMap[9][i * 10 + j] = Array(1...9)
//            }
//        }
//        for (i, ls) in board.enumerated() {
//            for (j, char) in ls.enumerated() {
//                if char == "." {
//                    continue
//                }
//                let res = fill(boardMap: &boardMap, num: char.wholeNumberValue!, tIndex: i * 10 + j)
//                if res == false {
//                    print("数组错误,不是一个有效的数独")
//                    return
//                }
//            }
//        }
//
//        testBoardMap(boardMap)
//        let val = tryFill(boardMap)
//        for (index, num) in val.1 {
//            board[index / 10][index % 10] = Character("\(num)")
//        }
//
////        let res = isValidSudoku(board)
////        print("-----------------------")
////
////        var count = 0
////        for (_, v) in boardMap.enumerated() {
////            count += v.count
////        }
////
////        print(res, val.0, val.1.count == count)
////        for ls in board {
////            print(ls)
////        }
//    }
//
//    private func tryFill(_ boardStack: [[Int: [Int]]]) -> (Bool, [Int: Int]) {
//
//        var result = [Int: Int]()
//        var boardMap = boardStack
//        while boardMap[1].count > 0 {
//            let index = boardMap[1].keys.first!
//            let num = boardMap[1].values.first![0]
//            let res = fill(boardMap: &boardMap, num: num, tIndex: index)
//            if res == false {
//                return (false, result)
//            } else {
//                result[index] = num
//            }
//        }
//
//        var item: (Int, [Int])?
//        for i in 2..<boardMap.count {
//            if !boardMap[i].isEmpty { ///找到可填入数最少的格子
//                let indexs = boardMap[i].keys.sorted(by: < )
//                let index = indexs.first!
//                let nums = boardMap[i][index]!
//                item = (index, nums)
//                break
//            }
//        }
//
//        if let item = item {
//            let index = item.0
//            let nums = item.1
//            for (i, num) in nums.enumerated() {
//                var boardMapC = boardMap
//                if fill(boardMap: &boardMapC, num: num, tIndex: index) {
//
//                    let res = tryFill(boardMapC) ///递归调用,填入失败就回溯
//                    if res.0 {
//                        result.merge(res.1) { (_, new) in new }
//                        result[index] = num
//                        return (true, result)
//                    }
//                }
//
//                if i == nums.count - 1 { ///相应格子可以填的数尝试填入的失败了,回溯至上一个节点
//                    return (false, result)
//                }
//            }
//        }
//        return (true, result) ///格子填满了,不需要再填,回调出去
//    }
//
//    private func fill(boardMap: inout [[Int: [Int]]], num: Int, tIndex: Int) -> Bool {
//        let row = tIndex / 10
//        let column = tIndex % 10
//        let bRow = (row - row % 3)
//        let bColumn = (column - column % 3)
//
//        var moveList = [Int: Int]()
//        for (i, dic) in boardMap.enumerated() {
//            for (key, nums) in dic {
//                let curRow = key / 10, curColumn = key % 10
//                let inBlock = (curRow >= bRow && curRow < bRow + 3 && curColumn >= bColumn && curColumn < bColumn + 3) ///填入会影响的块
//                if curRow == row || curColumn == column || inBlock {
//                    if let index = nums.firstIndex(of: num) {
//                        moveList[key] = i
//                        boardMap[i][key]!.remove(at: index)
//                        if key == tIndex { ///当前填的格子不用判断
//                            continue
//                        }
//                        if boardMap[i][key]!.count == 0 { ///有一个格子无法填入任何数字,代表失败
//                            return false
//                        }
//                    }
//                }
//            }
//        }
//        for (key, index) in moveList {
//            let nums = boardMap[index].removeValue(forKey: key)!
//            if key != tIndex, !nums.isEmpty {
//                boardMap[nums.count][key] = nums
//            }
//        }
//        return true
//    }
//
//    private func testBoardMap(_ boardMap: [[Int: [Int]]], pre: String = "") {
//            for (i, dic) in boardMap.enumerated() {
//                let indexs = boardMap[i].keys.sorted(by: < )
//                var log = "(\(i))"
//                for j in indexs {
//                    log.append(" \(j):\(dic[j]!)")
//                }
//                print(log)
//            }
//        }
}
