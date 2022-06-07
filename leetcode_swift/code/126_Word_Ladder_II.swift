//
//  126_Word_Ladder_II.swift
//  leetcode_swift
//
//  Created by jocker luo on 2022/2/8.
//

import Foundation

extension Solution {
    
    //https://leetcode.com/problems/word-ladder-ii/discuss/40572/my-30ms-bidirectional-bfs-and-dfs-based-java-solution
    //BFS(广度优先搜索)可以用queue(先进先出)来实现。
    //DFS(深度优先搜索)可以用栈来实现(后进先出)来实现。
    
    //是否连接了两个部分的标志
    private static var isConnected = false

    func findLadders(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> [[String]] {
        guard wordList.contains(endWord) else {
            return []
        }
        Self.isConnected = false

        //使用双向 BFS 寻找最短路径
        var fwd = Set<String>()
        fwd.insert(beginWord)

        var bwd = Set<String>()
        bwd.insert(endWord)

        var hs = [String: [String]]()

        var words = Set(wordList)
        BFS(&fwd, &bwd, &words, false, &hs)
        var result = [[String]]()

        //如果两个部分无法连接，则返回空列表
        if !Self.isConnected {
            return result
        }

        //需要将起始节点添加到临时列表中，因为没有其他节点可以获取起始节点
        var temp = [String]()
        temp.append(beginWord)

        DFS(&result, &temp, beginWord, endWord, &hs);
        
        return result;
    }

    private func BFS(_ forward: inout Set<String>,
                     _ backward: inout Set<String>,
                     _ dict: inout Set<String>,
                     _ swap: Bool,
                     _ hs: inout [String: [String]]) {

        //边界检查
        if(forward.isEmpty || backward.isEmpty){
            return;
        }

        //总是在节点较少的方向上做 BFS,这里假设前向集有更少的节点，如果没有，交换它们
        if forward.count > backward.count {
            BFS(&backward, &forward, &dict, !swap, &hs);
            return;
        }

        //从dict中删除所有向前/向后的单词以避免重复添加
        dict.subtract(forward)
        dict.subtract(backward)

        //新集合包含来自前向集合的所有新节点
        var set3 = Set<String>()

        //在正向的每个节点上做 BFS
        for str in forward {
            //尝试更改 str 的每个字符
            for i in 0..<str.count {
                //尝试用从 a 到 z 的每个字符替换当前字符
                for j in Character("a").asciiValue!...Character("z").asciiValue! {
                    var ary = Array(str)
                    ary[i] = Character(UnicodeScalar(j))
                    let temp = String(ary);

                    //如果它不在 dict 中也不在 back 中，跳过这个字符串
                    if !backward.contains(temp), !dict.contains(temp){
                        continue;
                    }

                    //跟随前进的方向
                    let key = !swap ? str : temp
                    let val = !swap ? temp : str

                    if hs[key] == nil {
                        hs[key] = []
                    }

                    //如果临时字符串是向后设置的，那么它将连接两个部分
                    if backward.contains(temp) {
                        hs[key]?.append(val)
                        Self.isConnected = true;
                    }

                    //如果 temp 在 dict 中，那么我们可以将它添加到 set3 作为下一层的新节点
                    if !Self.isConnected, dict.contains(temp) {
                        hs[key]?.append(val)
                        set3.insert(temp)
                    }
                }

            }
        }

        //为了强制路径最短，如果找到了最短路径，将不会执行 BFS(isConnected = true)
        if !Self.isConnected {
            BFS(&set3, &backward, &dict, swap, &hs)
        }
    }

    //将使用 DFS，更具体地说是回溯来构建路径
    private func DFS(_ result: inout [[String]],
                     _ temp: inout [String],
                     _ start: String,
                     _ end: String,
                     _ hs: inout [String: [String]]) {

        //边界情况
        if start == end {
            let ls = temp
            result.append(ls)
            return;
        }

        //不是hs中的每个节点都是最短路径的有效节点，如果我们发现当前节点没有子节点，那么这意味着它不在最短路径中
        guard let ls = hs[start] else {
            return
        }

        for s in ls {
            temp.append(s)
            DFS(&result, &temp, s, end, &hs);
            temp.removeLast()
        }
    }
    
//    private static var maxStep = Int.max
//    private static var findPaths = [[Int]]()
//    private static var dp = [[Int]]()
//
//    func findLadders(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> [[String]] {
//        guard wordList.contains(endWord) else {
//            return []
//        }
//        let words = [beginWord] + wordList.filter({ return $0 != endWord && $0 != beginWord }) + [endWord]
//        let n = words.count
//        let wordLs = words.map { Array($0) }
//        let wordLen = beginWord.count
//        var dp = Array(repeating: Array(repeating: 0, count: n), count: n)
//        for i in 0..<n {
//            for j in i + 1..<n {
//                let ls1 = wordLs[i], ls2 = wordLs[j]
//                var num = 0
//                for idx in 0..<wordLen {
//                    if ls1[idx] != ls2[idx] {
//                        num += 1
//                        if num > 1 {
//                            break
//                        }
//                    }
//                }
//                if num == 1 {
//                    dp[i][j] = 1
//                    dp[j][i] = 1
//                }
//            }
//        }
//
//        Self.findPaths = []
//        Self.maxStep = n
//        Self.dp = dp
//        _findLadders(path: Array(repeating: -1, count: n), step: 0, curr: 0)
//        var res = [[String]]()
//        for path in Self.findPaths.reversed() {
//            var ls = [String]()
//            var idx = 0
//            while path[idx] != -1 {
//                ls.append(words[idx])
//                idx = path[idx]
//            }
//            ls.append(endWord)
//            if let last = res.last, ls.count > last.count {
//                break
//            } else {
//                res.append(ls)
//            }
//        }
//        return res
//    }
//
//    private func _findLadders(path: [Int], step: Int, curr: Int) {
//        if step >= Self.maxStep {
//            return
//        }
//        let ls = Self.dp[curr]
//        for (index, flag) in ls.enumerated() {
//            if path[index] == -1, flag == 1 {
//                var cPath = path
//                cPath[curr] = index
//                if index == ls.count - 1 {
//                    Self.maxStep = min(Self.maxStep, step + 1)
//                    Self.findPaths.append(cPath)
//                } else {
//                    _findLadders(path: cPath, step: step + 1, curr: index)
//                }
//            }
//        }
//    }
}
