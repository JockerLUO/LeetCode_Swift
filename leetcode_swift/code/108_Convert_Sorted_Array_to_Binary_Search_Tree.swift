//
//  108_Convert_Sorted_Array_to_Binary_Search_Tree.swift
//  leetcode_swift
//
//  Created by jocker luo on 2022/1/19.
//

import Foundation

extension Solution {
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        if nums.count == 1 {
            return TreeNode(nums[0])
        } else if nums.count == 0 {
            return nil
        }
        let mid = nums.count / 2
        let node = TreeNode(nums[mid])
        node.left = sortedArrayToBST(Array(nums[..<mid]))
        node.right = sortedArrayToBST(Array(nums[(mid + 1)...]))
        return node
    }
}
