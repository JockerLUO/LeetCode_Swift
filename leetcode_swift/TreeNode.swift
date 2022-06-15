//
//  TreeNode.swift
//  leetcode_swift
//
//  Created by jocker luo on 2021/11/26.
//

import Foundation

enum TreeNodeTraversalType {
    ///前序
    case preorder
    ///中序
    case inorder
    ///后序
    case postorder
}

protocol TreeNodeProtocol: NSObjectProtocol {
    
    associatedtype Item: TreeNodeProtocol

    var val: Int { get set }
    var left: Item? { get set }
    var right: Item? { get set }
    
    init(_ val: Int)
    init?(nums: [Int?])
    func traversal(_ type: TreeNodeTraversalType) -> [Int]
    func levelOrder() -> [[Int]]
    func descripMap() -> String
}

extension TreeNodeProtocol {
    func traversal(_ type: TreeNodeTraversalType = .inorder) -> [Int] {
        var nums = [Int]()
        _traversal(self, &nums, type)
        return nums
    }
    
    private func _traversal<T>(_ node:T, _ nums: inout [Int], _ type: TreeNodeTraversalType) where T: TreeNodeProtocol {
        if type == .preorder {
            nums.append(node.val)
        }
        if let leftNode = node.left {
            _traversal(leftNode, &nums, type)
        }
        if type == .inorder {
            nums.append(node.val)
        }
        if let rightNode = node.right {
            _traversal(rightNode, &nums, type)
        }
        if type == .postorder {
            nums.append(node.val)
        }
    }
    
    func fullLevel() -> [[Int?]] {
        var res = [[Int?]]()
        var nextNodes: [Self?] = [self]
        while !nextNodes.filter({ $0 != nil }).isEmpty {
            let count = nextNodes.count
            var nodes = [Self?]()
            var nums = [Int?]()
            for i in 0..<count {
                let node = nextNodes[i]
                nums.append(node?.val)
                nodes.append(node?.left as? Self)
                nodes.append(node?.right as? Self)
            }
            nextNodes = nodes
            res.append(nums)
        }
        return res
    }

        
    func levelOrder() -> [[Int]] {
        var res = [[Int]]()
        var nextNodes = [self]
        while !nextNodes.isEmpty {
            let count = nextNodes.count
            var nodes = [Self]()
            var nums = [Int]()
            for i in 0..<count {
                let node = nextNodes[i]
                nums.append(node.val)
                if let left = node.left as? Self {
                    nodes.append(left)
                }
                if let right = node.right as? Self {
                    nodes.append(right)
                }
            }
            nextNodes = nodes
            res.append(nums)
        }
        return res
    }
    
    init?(nums: [Int?]) {
        guard !nums.isEmpty, nums.first != nil else {
            return nil
        }
        self.init(nums[0]!)
        
        var preLevel = [self]
        var currLevel = [Self]()
        var leftFlag = true
        
        var curr = self
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
                let node = Self(num!) as? Self.Item
                if leftFlag {
                    curr.left = node
                    leftFlag = false
                } else {
                    curr.right = node
                    shift = true
                }
                currLevel.append(node as! Self)
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
    }
    
    func descripMap() -> String {
        let list = fullLevel()
        var desc = "\n"
        
        for (level, ls) in list.enumerated() {
            var delimiter = ""
            for _ in 0..<((pow(2, list.count - 1 - level) as NSDecimalNumber).intValue - 1) {
                delimiter.append("\t")
            }
            for (index, num) in ls.enumerated() {
                var chr = ""
                if level == 0 {
                    for _ in 0..<((pow(2, list.count - 2) as NSDecimalNumber).intValue - 1) {
                        desc.append("\t")
                    }
                    desc.append("  ")
                }
                if let num = num {
                    chr = "\(num)"
                } else {
                    chr = "*"
                }
                if index < ls.count / 2 {
                    desc.append(delimiter)
                    desc.append(chr)
                } else {
                    desc.append(chr)
                    desc.append(delimiter)
                }
                desc.append("\t")
            }
            desc.append("\n")
        }
        return desc
    }
}

class TreeNode: NSObject, TreeNodeProtocol {
    
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    override init() { self.val = 0; self.left = nil; self.right = nil; }
    required init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
    
    override var description: String {
        return descripMap()
    }
}
