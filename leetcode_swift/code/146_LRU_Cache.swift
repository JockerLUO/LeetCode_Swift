//
//  146_LRU_Cache.swift
//  leetcode_swift
//
//  Created by jocker luo on 2022/7/13.
//

import Foundation

class LRUCache {
    ///双向链表
    class ListNode {
        var val: Int
        let key: Int
        ///下一个节点
        var next: ListNode?
        ///前驱节点
        weak var pre: ListNode?
        init(_ key: Int, _ val: Int) {
            self.val = val
            self.key = key
        }
    }
    
    
    let capacity: Int
    private var map = [Int: ListNode]()
    private var head: ListNode?
    private var tail: ListNode?
    private var count = 0

    init(_ capacity: Int) {
        self.capacity = capacity
    }
    
    func get(_ key: Int) -> Int {
        if let node = _get(key) {
            return node.val
        } else {
            return -1
        }
    }
    
    private func _get(_ key: Int) -> ListNode? {
        if let node = map[key] {
            let pre = node.pre, next = node.next
            
            if node === tail, count > 1 {
                tail = pre
            }
            if node !== head, count > 1 {
                pre?.next = next
                next?.pre = pre
                
                node.pre = nil
                node.next = head
                head?.pre = node
                
                head = node
            }
            
            return node
        } else {
            return nil
        }
    }
    
    func put(_ key: Int, _ value: Int) {
        if let node = _get(key) {
            node.val = value
        } else {
            let node = ListNode(key, value)
            
            node.next = head
            head?.pre = node
            
            head = node
            map[key] = node
            
            if tail == nil {
                tail = node
            }
            count += 1
            
            if count > capacity {
                _pop()
            }
        }
    }
    
    private func _pop() {
        if count > 0, tail != nil {
            map.removeValue(forKey: tail!.key)
            tail = tail?.pre
            tail?.next = nil
            count -= 1
        }
    }
}
