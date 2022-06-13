//
//  133_Clone_Graph.swift
//  leetcode_swift
//
//  Created by jocker luo on 2022/6/8.
//

import Foundation

extension Solution {
    
    static var visited = [Int: Node]()

    func cloneGraph(_ node: Node?) -> Node? {
        guard let node = node else {
            return nil
        }
        Self.visited = [:]
        return _cloneGraph(node)
    }
    
    private func _cloneGraph(_ node: Node?) -> Node? {
        guard let node = node else {
            return nil
        }
        let root = Node(node.val)
        Self.visited[node.val] = root
        for i in 0..<node.neighbors.count {
            let cNode = Self.visited[node.neighbors[i]!.val]
            if let cNode = cNode {
                root.neighbors.append(cNode)
            } else {
                let hNode = node.neighbors[i]
                root.neighbors.append(_cloneGraph(hNode))
            }
        }
        return root
    }

}
