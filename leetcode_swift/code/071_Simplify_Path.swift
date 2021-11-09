//
//  071_Simplify_Path.swift
//  leetcode_swit
//
//  Created by jocker luo on 2021/11/8.
//

import Foundation

extension Solution {

    func simplifyPath(_ path: String) -> String {
        var directories = [String]()
        let components = path.split(separator: "/")
        for component in components {
            switch component {
            case "": break // do nothing
            case ".": break // do nothing, pointing to the current directory
            case "..":
                directories.popLast() // if empty, does nothing
            default:
                directories.append(String(component))
            }
        }
        return "/" + String(directories.joined(separator: "/"))
    }
}
