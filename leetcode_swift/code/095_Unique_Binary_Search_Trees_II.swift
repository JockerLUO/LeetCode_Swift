//
//  095_Unique_Binary_Search_Trees_II.swift
//  leetcode_swift
//
//  Created by jocker luo on 2021/11/30.
//

import Foundation

extension Solution {
    func generateTrees(_ n: Int) -> [TreeNode?] {
        if n == 0 {
            return []
        }
        let res = get_trees(1, n)
        
        return res
    }
    private func get_trees(_ start: Int, _ end: Int) -> [TreeNode?] {
        
        var res = [TreeNode?]()
        if start > end {
            res.append(nil)
            return res
        }
        
        for i in start...end {
            let lefts = get_trees(start, i - 1)
            let right = get_trees(i + 1, end)
            
            for j in 0..<lefts.count {
                for k in 0..<right.count {
                    let root = TreeNode(i)
                    root.left = lefts[j]
                    root.right = right[k]
                    res.append(root)
                }
            }
        }
        return res
    }
    
    //    func generateTrees(_ n: Int) -> [TreeNode?] {
    //        let root = buildTree(1, n)
    //        var res = [root]
    //
    //        var leftTree = cloneTree(root).0
    //        leftTree = leftRotate(leftTree)
    //        if leftTree != nil {
    //            res.append(leftTree)
    //            res.append(contentsOf: _generateTrees(leftTree, leftTree?.left))
    //        }
    //
    //        var rightTree = cloneTree(root).0
    //        rightTree = rightRotate(rightTree)
    //        if rightTree != nil {
    //            res.append(rightTree)
    //            res.append(contentsOf: _generateTrees(rightTree, leftTree?.right))
    //        }
    //
    //        print(res)
    //
    //        return res
    //    }
    //
    //    private func buildTree(_ left: Int, _ right: Int) -> TreeNode? {
    //        if left >= right {
    //            return nil
    //        }
    //        let mid = (left + right) / 2
    //        let root = TreeNode(mid)
    //        if mid - left == 1 {
    //            root.left = TreeNode(left)
    //        } else {
    //            root.left = buildTree(left, mid)
    //        }
    //
    //        if right - mid == 1 {
    //            root.right = TreeNode(right)
    //        } else {
    //            root.right = buildTree(mid + 1, right)
    //        }
    //        return root
    //    }
    //
    //    private func cloneTree(_ tree: TreeNode?, _ target: TreeNode? = nil) -> (TreeNode?, TreeNode?) {
    //        guard let tree = tree else { return (nil, nil) }
    //        let root = TreeNode(tree.val)
    //        var tNodo: TreeNode?
    //        if tree === target {
    //            tNodo = root
    //        }
    //        let left = cloneTree(tree.left, target)
    //        root.left = left.0
    //        if left.1 != nil {
    //            tNodo = left.1
    //        }
    //
    //        let right = cloneTree(tree.right, target)
    //        root.right = right.0
    //        if right.1 != nil {
    //            tNodo = right.1
    //        }
    //
    //        return (root, tNodo)
    //    }
    //
    //    private func _generateTrees(_ root: TreeNode?, _ parent: TreeNode?) -> [TreeNode?] {
    //        if parent?.left == nil, parent?.right == nil {
    //            return []
    //        }
    //        if parent == nil {
    //            return []
    //        }
    //
    //        var res = [TreeNode?]()
    //
    //        var leftTree = cloneTree(parent?.left).0
    //        leftTree = leftRotate(leftTree)
    //        if leftTree != nil {
    //            let item = cloneTree(root, parent)
    //            item.1?.left = leftTree
    //            res.append(item.0)
    //            res.append(contentsOf: _generateTrees(item.0, leftTree))
    //        }
    //
    //
    //        var rightTree = cloneTree(parent?.right).0
    //        rightTree = rightRotate(rightTree)
    //        if rightTree != nil {
    //            let item = cloneTree(root, parent)
    //            item.1?.right = rightTree
    //            res.append(item.0)
    //            res.append(contentsOf: _generateTrees(item.0, rightTree))
    //        }
    //
    //        return res
    //    }
    //
    //    private func rightRotate(_ y: TreeNode?) -> TreeNode? {
    //        let x = y?.left;
    //        // 保存x节点的右子树，即使右子树为空，也没关系
    //        let child = x?.right;
    //
    //        // 右旋
    //        x?.right = y;
    //        // 将原本x的右子树放在y的左子树的位置
    //        y?.left = child;
    //
    //        return x
    //    }
    //
    //    private func leftRotate(_ y: TreeNode?) -> TreeNode?{
    //        let x = y?.right;
    //        // 保存x节点的右子树，即使右子树为空，也没关系
    //        let child = x?.left;
    //
    //        // 左旋
    //        x?.left = y;
    //        // 将原本x的左子树放在y的右子树的位置
    //        y?.right = child;
    //
    //        return x
    //    }
    
}
