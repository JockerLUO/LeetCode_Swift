//
//  073_Set_Matrix_Zeroes.swift
//  leetcode_swift
//
//  Created by jocker luo on 2021/11/9.
//

import Foundation

extension Solution {
    func setZeroes(_ matrix: inout [[Int]]) {
        let m = matrix.count, n = matrix[0].count
        
        var mFlag = false, nFlag = false ///可以使用二进制简化为一个变量
        
        for i in 0..<m {
            if matrix[i][0] == 0 {
                mFlag = true
                break
            }
        }
        
        for j in 0..<n {
            if matrix[0][j] == 0 {
                nFlag = true
                break
            }
        }
        
//        print(nFlag, mFlag)
//        print(matrix)

        for i in 1..<m {
            for j in 1..<n{
                if matrix[i][j] == 0 {
                    matrix[0][j] = 0
                    matrix[i][0] = 0
                }
            }
        }
        
//        print("c", matrix)
        
        for i in 1..<m {
            if matrix[i][0] == 0 {
                for j in 0..<n {
                    matrix[i][j] = 0
                }
            }
        }
        
//        print("m", matrix)

        for j in 1..<n {
            if matrix[0][j] == 0 {
                for i in 0..<m {
                    matrix[i][j] = 0
                }
            }
        }
        
//        print("n", matrix)

        if mFlag {
            for i in 0..<m {
                matrix[i][0] = 0
            }
        }
        if nFlag {
            for j in 0..<n {
                matrix[0][j] = 0
            }
        }
    }
}
