//
//  036_Valid Sudoku.swift
//  leetcode_swit
//
//  Created by jocker luo on 2021/10/11.
//

import Foundation

extension Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        var boardMap = [Character:[[Int]]]()
        for (i, ls) in board.enumerated() {
            for (j, char) in ls.enumerated() {
                if char == "." {
                    continue
                }
                let k = i / 3 * 3 + j / 3
                if boardMap[char] == nil {
                    boardMap[char] = Array(repeating: Array(repeating: 0, count: 9), count: 3)
                }
                let vaules = [i, j, k]
                for i in 0..<3 {
                    if boardMap[char]![i][vaules[i]] != 0 {
                        return false
                    } else {
                        boardMap[char]![i][vaules[i]] = 1
                    }
                }
            }
        }
        return true
    }
}
