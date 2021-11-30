//
//  TreeNode.swift
//  leetcode_swift
//
//  Created by jocker luo on 2021/11/26.
//

import Foundation

public class TreeNode: NSObject {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public override init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
    
    static func format(_ nums: [Int?])-> TreeNode? {
        guard !nums.isEmpty, nums.first != nil else {
            return nil
        }
        let rootNode = TreeNode(nums[0]!)
        
        var preLevel = [rootNode]
        var currLevel = [TreeNode]()
        var leftFlag = true
        
        var curr = rootNode
        var level = 1
        for i in 1..<nums.count {
            let num = nums[i]
            
            var shift = false
            if num == nil {
                if leftFlag {
                    leftFlag = false
                } else {
                    shift = true
                }

            } else {
                let node = TreeNode(num!)
                if leftFlag {
                    curr.left = node
                } else {
                    curr.right = node
                    shift = true
                }
                currLevel.append(node)
            }
            
            if shift {
                if curr !== preLevel.last {
                    curr = preLevel[preLevel.firstIndex(where: { node in
                        node === curr
                    })! + 1]
                    leftFlag = true
                } else {
                    preLevel = currLevel
                    currLevel = []
                    curr = preLevel[0]
                    level += 1
                    leftFlag = true
                }
            }
        }
        return rootNode
    }
    
    public override var description: String {
        get {
            var description = "\(val)"
            if let left = left {
                description.append("\( left.val)")
            }
            if let right = right {
                description.append("\( right.val)")
            }
            description = "(\(description))"
            return description
        }
    }
}
