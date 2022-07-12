//
//  143_Reorder_List.swift
//  leetcode_swift
//
//  Created by jocker luo on 2022/6/15.
//

import Foundation

extension Solution {
    ///1.快慢指针找到中点 2.拆成两个链表 3.遍历两个链表，后面的塞到前面的“缝隙里”
    func reorderList(_ head: ListNode?) {
        var low = head
        var quick = head?.next
        while quick?.next != nil || quick?.next?.next != nil {
            low = low?.next
            quick = quick?.next?.next
        }
        
        var n1 = low?.next
        var n2 = n1?.next
        var n3 = n2?.next
        low?.next = nil
        n1?.next = nil

        if n2 != nil {
            repeat {
                n2?.next = n1
                n1 = n2
                let temp = n3?.next
                n3?.next = n2
                n2 = n3
                n3 = temp

            } while n3 != nil            
        }
                                
        let head2 = n2 != nil ? n2 : n1
    
        var curr1 = head
        var curr2 = head2
        while curr1 != nil {
            let temp1 = curr1?.next
            let temp2 = curr2?.next
            curr1?.next = curr2
            curr2?.next = temp1
            curr1 = temp1
            curr2 = temp2
        }
    }
}
