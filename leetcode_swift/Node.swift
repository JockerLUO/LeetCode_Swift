//
//  Node.swift
//  leetcode_swift
//
//  Created by jocker luo on 2022/6/14.
//

import Foundation

class Node: NSObject, TreeNodeProtocol {
    var val: Int
    var left: Node?
    var right: Node?
    var next: Node?
    required  init(_ val: Int) {
        self.val = val
    }
    
    override var description: String {
        return descripMap()
    }
    
    ///用于133题
    var neighbors: [Node?] = []
    convenience init(graghNums: [[Int]]) {
        self.init(1)
        var nodeMap = [Int: Node]()
        nodeMap[1] = self
        for i in 0..<graghNums.count {
            for j in graghNums[i] {
                let node = nodeMap[i + 1] ?? Node(i + 1)
                nodeMap[i + 1] = node
                let hNode = nodeMap[j] ?? Node(j)
                nodeMap[j] = hNode
                node.neighbors.append(hNode)
            }
        }
    }
    
    ///用于138题
    var random: Node?
}

