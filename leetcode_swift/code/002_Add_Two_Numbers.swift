import Foundation

extension Solution {
    
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        let headNode = ListNode(0)
        var nextNode: ListNode?  = headNode
        var offset = 0
        var n1 = l1
        var n2 = l2

        repeat {
            var val = 0
            val += n1?.val ?? 0
            val += n2?.val ?? 0
            val += offset
            
            offset = val / 10
            
            nextNode?.next = ListNode(val % 10)
            nextNode = nextNode?.next
            
            n1 = n1?.next
            n2 = n2?.next
            
        } while (n1 != nil || n2 != nil || offset != 0)
        
        return headNode.next
    }
    
//    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
//        guard let l1 = l1 else {
//            return l2
//        }
//        guard let l2 = l2 else {
//            return l1
//        }
//
//        let val = l1.val + l2.val
//        let headNode = ListNode(val % 10)
//        var nextNode = addTwoNumbers(l1.next, l2.next)
//        if val > 9 {
//            nextNode = addTwoNumbers(nextNode, ListNode(1))
//        }
//        headNode.next = nextNode
//
//        return headNode
//    }
}
