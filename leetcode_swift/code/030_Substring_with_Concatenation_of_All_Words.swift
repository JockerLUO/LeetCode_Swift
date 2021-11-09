//
//  030_Substring_with_Concatenation_of_All_Words.swift
//  leetcode_swit
//
//  Created by jocker luo on 2021/9/29.
//

import Foundation

extension Solution {
    
    ///https://github.com/bofeizhu/LeetCode-Swift/blob/master/0030-substring-with-concatenation-of-all-words.playground/Contents.swift
    func findSubstring(_ s: String, _ words: [String]) -> [Int] {
        guard !words.isEmpty else { return [] }
        let wordSize = words[0].count
        let windowSize = wordSize * words.count
        guard s.count >= windowSize else { return [] }

        // Build a counted set for words
        var wordCounts: [String: Int] = [:]
        words.forEach { wordCounts[$0, default: 0] += 1}

        let chars = Array(s) // substring is extremly slow, so use character array here
        var result: [Int] = []
        for i in 0..<wordSize {
            var left = i
            var right = i
            var counts: [String: Int] = wordCounts
            var found = 0  //*用found来判定是否找到
            while right <= chars.count - wordSize {
                let word = String(chars[right..<right + wordSize])
                right += wordSize
                if let count = counts[word] {
                    counts[word] = count - 1
                    if count == 1 {
                        found += 1 //*
                    }
                }

                if found == counts.count {
                    result.append(left) //*
                }

                guard right - left == windowSize else { continue }
                let head = String(chars[left..<left + wordSize])
                if let count = counts[head] {
                    counts[head] = count + 1
                    if count == 0 {
                        found -= 1 //*
                    }
                }
                left += wordSize
            }
        }
        return result
    }
    
        func findSubstring_l(_ s: String, _ words: [String]) -> [Int] {
            var res = [Int]()
            guard !words.isEmpty, s.count >= words.first!.count else {
                return res
            }

            let ls = s.count, word_ls = words.first!.count
            let windowSize = word_ls * words.count
            var target_dict = [String: Int]() ///各个字符串需要匹配的次数
            words.forEach { target_dict[$0, default: 0] += 1}
            let chars = Array(s)

    //        var iStr = ""
    //        var cStr = ""
    //        for (i, c) in Array(s).enumerated() {
    //            iStr.append(String(i) + "\t")
    //            cStr.append(String(c) + "\t")
    //        }
    //        print(iStr)
    //        print(cStr)
    //        print(words)
    //        print(target_dict)
    //        print()

            for index in 0..<word_ls {  ///把字符串分解成多个循环
                var start = index ///初次开始的位置

                var pre_dict: [String: Int]?        //根据前一次匹配,这次匹配的初始字典
                var posOfsset = 0                   //下一次匹配开始的初始偏差
                var wordsMap = [String: [Int]]()    //目标字符出现位置的字典
                words.forEach { wordsMap[$0] = [Int]() }

                while start < (ls - word_ls * words.count + 1) {

                    var curr_dict = pre_dict ?? target_dict
                    var flag = true
                    var offset = word_ls  ///下次匹配将要滑动的距离
    //                print(""start, posOfsset, curr_dict)

                    for pos in stride(from: start + posOfsset, to: start + windowSize, by: word_ls) {
                        let curr = String(chars[pos..<pos + word_ls])
                        if curr_dict[curr] != nil {
                            wordsMap[curr]?.append(pos)
                            curr_dict[curr]! -= 1

                            if curr_dict[curr]! < 0 {  ///出现了重复匹配
                                let wordList = wordsMap[curr]!
                                let preIndex = wordList[wordList.count - 1 - target_dict[curr]!]

                                offset = preIndex - start + word_ls
                                posOfsset = pos - preIndex

                                pre_dict = target_dict
                                for word in pre_dict!.keys {
                                    if curr == word {
                                        pre_dict?[word] = 0
                                    } else {
                                        for i in wordsMap[word]!.reversed() {
                                            if i > preIndex {
                                                pre_dict?[word]! -= 1
                                            } else {
                                                break
                                            }
                                        }
                                    }
                                }
                                flag = false
    //                            print(curr, start, pos, preIndex, offset, posOfsset, pre_dict!)
                                break
                            }
                        } else {  ///出现的无法匹配的情况
                            offset = max(offset, pos - start)
                            posOfsset = 0
                            pre_dict = nil

                            flag = false
                            break
                        }
                    }
                    if flag {  ///完全匹配
                        posOfsset = word_ls * (words.count - 1)
                        let fistWord = String(chars[start..<start + word_ls])
                        pre_dict = curr_dict
                        pre_dict?[fistWord] = 1

                        res.append(start)
                    }
                    start += offset
                }
            }
            return res
        }
}
