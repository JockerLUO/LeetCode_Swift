//
//  127_Word_Ladder.swift
//  leetcode_swift
//
//  Created by jocker luo on 2022/5/15.
//

import Foundation

extension Solution {
    private static var isConnected = false
    private static var forNum = 0
    private static var backNum = 0
    private static var ladderLength = 0

    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        guard wordList.contains(endWord) else {
            return 0
        }
        Self.isConnected = false
        Self.forNum = 0
        Self.backNum = 0
        Self.ladderLength = 0
        
        //使用双向 BFS 寻找最短路径
        var fwd = Set<String>()
        fwd.insert(beginWord)

        var bwd = Set<String>()
        bwd.insert(endWord)

        var words = Set(wordList)
        words.remove(beginWord)
        words.remove(endWord)
        
        return BFS(fwd, bwd, &words, 2)
    }
    
    private func BFS(_ forward: Set<String>,
                     _ backward: Set<String>,
                     _ wordList: inout Set<String>,
                     _ level: Int
    ) -> Int {
        if(forward.isEmpty || backward.isEmpty){
            return 0
        }
        if forward.count > backward.count {
            return BFS(backward, forward, &wordList, level)
        }
        var isConnected = false
        var next_level = Set<String>()

        for word in forward {
            for c in Character("a").asciiValue!...Character("z").asciiValue! {
                for i in 0..<word.count {
                    var ary = Array(word)
                    ary[i] = Character(UnicodeScalar(c))
                    let neigh = String(ary)
                    if backward.contains(neigh) {
                        isConnected = true
                        return level
                    }
                    if !isConnected && wordList.contains(neigh) {
                        next_level.insert(neigh)
                        wordList.remove(neigh)
                    }
                }
            }
        }
        return BFS(next_level, backward, &wordList, level + 1)
    }
}
