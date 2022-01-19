//
//  109_Convert_Sorted_List_to_Binary_Search_Tree.swift
//  leetcode_swift
//
//  Created by jocker luo on 2022/1/19.
//

import Foundation

extension Solution {
    func sortedListToBST(_ head: ListNode?) -> TreeNode? {
        if head == nil {
            return nil
        }
        if head?.next == nil {
            return TreeNode(head!.val)
        }
        var pre = head
        var p = head?.next
        var q = p?.next
        while p != nil, q?.next != nil {
            pre = pre?.next
            p = pre?.next
            q = q?.next?.next
        }
        pre?.next = nil
        
        let root = TreeNode(p!.val)
        root.left = sortedListToBST(head)
        root.right = sortedListToBST(p?.next)
        return root
    }
}
