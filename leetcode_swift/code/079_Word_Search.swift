//
//  079_Word_Search.swift
//  leetcode_swift
//
//  Created by jocker luo on 2021/11/10.
//

import Foundation

extension Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        guard !word.isEmpty else { return false }
        let ls = Array(word)
        let m = board.count, n = board[0].count
        var visited = Array(repeating: Array(repeating: false, count: n), count: m)

        for i in 0..<m {
            for j in 0..<n {
                if board[i][j] == ls[0] {
                    visited[i][j] = true
                    if exist(board, ls, 1, (i, j) , &visited) {
                        return true
                    } else {
                        visited[i][j] = false
                    }
                }
            }
        }
        return false
    }

    
    /// - Parameters:
    ///   - wordContent: 直接使用[Character], 使用String 再转 [Character] 会导致过多的运行时间
    private func exist(_ board: [[Character]], _ wordContent: [Character], _ offset:Int,  _ index: (Int, Int), _ visited: inout [[Bool]]) -> Bool {
        if offset == wordContent.count {
            return true
        }

        let indexs = [(index.0 - 1, index.1),
                      (index.0,     index.1 - 1),
                      (index.0 + 1, index.1),
                      (index.0,     index.1 + 1)]
        let m = board.count, n = board[0].count

        for (i, j) in indexs {
            guard i >= 0, i < m else { continue }
            guard j >= 0, j < n else { continue }
            guard !visited[i][j] else { continue }
            guard board[i][j] == wordContent[offset] else { continue }
            visited[i][j] = true
            if exist(board, wordContent, offset + 1, (i, j) , &visited) {
                return true
            } else {
                visited[i][j] = false
            }
        }
        return false
    }
    
//
//    func exist(_ board: [[Character]], _ word: String) -> Bool {
//        guard !word.isEmpty else { return false }
//        let ls = Array(word)
//        let m = board.count, n = board[0].count
//
//        for i in 0..<m {
//            for j in 0..<n {
//                let char = board[i][j]
//                if char == ls[0] {
//                    var boardC: [[Character]] = board
//                    boardC[i][j] = " "
//                    if exist(boardC, String(ls[1...]), (i, j)) {
//                        return true
//                    }
//                }
//            }
//        }
//        return false
//    }
//
//    private func exist(_ board: [[Character]], _ word: String, _ index: (Int, Int)) -> Bool {
//        guard !word.isEmpty else { return true }
//
//        let indexs = [(index.0 - 1, index.1),
//                      (index.0,     index.1 - 1),
//                      (index.0 + 1, index.1),
//                      (index.0,     index.1 + 1)]
//        let ls = Array(word)
//        let m = board.count, n = board[0].count
//
//        for (i, j) in indexs {
//            guard i >= 0, i < m else { continue }
//            guard j >= 0, j < n else { continue }
//            let char = board[i][j]
//            if char == ls[0] {
//                var boardC: [[Character]] = board
//                boardC[i][j] = " "
//                if exist(boardC, String(ls[1...]), (i, j)) {
//                    return true
//                }
//            }
//        }
//        return false
//    }
    
//    func exist(_ board: [[Character]], _ word: String) -> Bool {
//        guard board.count > 0 && board[0].count > 0 else {
//            return false
//        }
//
//        let m = board.count
//        let n = board[0].count
//        var visited = Array(repeating: Array(repeating: false, count: n), count: m)
//        let wordContent = Array(word)
//
//        for i in 0..<m {
//            for j in 0..<n {
//                if board[i][j] == wordContent[0] && _dfs(board, wordContent, m, n, i, j, &visited, 0) {
//                    return true
//                }
//            }
//        }
//
//        return false
//    }
//
//    private func _dfs(_ board: [[Character]], _ wordContent: [Character], _ m: Int, _ n: Int, _ i: Int, _ j: Int, _ visited: inout [[Bool]], _ index: Int) -> Bool {
//        if index == wordContent.count {
//            return true
//        }
//
//        guard i >= 0 && i < m && j >= 0 && j < n else {
//            return false
//        }
//        guard !visited[i][j] && board[i][j] == wordContent[index] else {
//            return false
//        }
//
//        visited[i][j] = true
//
//        if _dfs(board, wordContent, m, n, i + 1, j, &visited, index + 1) || _dfs(board, wordContent, m, n, i - 1, j, &visited, index + 1) || _dfs(board, wordContent, m, n, i, j + 1, &visited, index + 1) || _dfs(board, wordContent, m, n, i, j - 1, &visited, index + 1) {
//            return true
//        }
//        visited[i][j] = false
//
//        return false
//    }
}
