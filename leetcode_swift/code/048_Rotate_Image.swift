//
//  048_Rotate_Image.swift
//  leetcode_swit
//
//  Created by jocker luo on 2021/10/28.
//

import Foundation

extension Solution {
    func rotate(_ matrix: inout [[Int]]) {
//        print("---")
//        for nums in matrix {
//            print(nums)
//        }
//        print("---")
        
        let n = matrix.count
        for i in 0..<n / 2 {
            for j in i..<n - 1 - i {
                
                var indexs = Array(repeating: (-1, -1), count: 4)
                
                indexs[0] = (i, j)
                indexs[2] = (n - 1 - i, n - 1 - j)
                indexs[1] = (indexs[0].1, indexs[2].0)
                indexs[3] = (indexs[2].1, indexs[0].0)
                
                let count = 4
                let temp = matrix[indexs[count - 1].0][indexs[count - 1].1]
                for k in 0..<count - 1 {
                    let index = indexs[count - 1 - k]
                    let nextIndex = indexs[count - 2 - k]
                    matrix[index.0][index.1] = matrix[nextIndex.0][nextIndex.1]
                }
                matrix[indexs[0].0][indexs[0].1] = temp
            }
        }
        
//        print("---")
//        for nums in matrix {
//            print(nums)
//        }
//        print("---")
    }
}
