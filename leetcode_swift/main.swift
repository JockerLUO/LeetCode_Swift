//
//  main.swift
//  leetcode_swit
//
//  Created by jocker luo on 2021/9/17.
//

import Foundation

class Solution {
}

func run() {
    let s = Solution()
//    let res = s.findMedianSortedArrays([1, 3, 5, 7, 10, 13], [2, 10, 11, 100, 111, 1222, 7777])
//    let res = s.longestPalindrome("ssss")
//    let res = s.convert("PAYPALISHIRING", 3)
//    let res = s.reverse(1534236469)
//    let res = s.myAtoi("  +  413")
//    let res = s.maxArea([2,3,4,5,18,17,6])
//    let res = s.intToRoman(1994)
//    let res = s.longestCommonPrefix(["flower","flow","flight"])
//    let res = s.threeSumClosest([-1,2,1,-4], 1)
//    let res = s.letterCombinations("23")
//    let res = s.fourSum([1,4,-3,0,0,0,5,0],0)
//    let res = s.mergeTwoLists(ListNode.format([1, 2, 4]), ListNode.format([1, 3, 4]))
//    let res = s.generateParenthesis(3)
//    let res = s.mergeKLists([ListNode.format([1, 4, 5]), ListNode.format([1, 3, 4]), ListNode.format([2, 6])])
//    let res = s.swapPairs(ListNode.format([1,2,3, 4, 5, 6, 7]))
//    let res = s.reverseKGroup(ListNode.format([1,2,3, 4, 5, 6, 7]), 4)
//    var nums = [0,0,1,1,1,2,2,3,3,4]
//    let res = s.removeDuplicates(&nums)
//    var nums = [3, 2, 2, 3]
//    let res = s.removeElement(&nums, 3)
//    let res = s.strStr("aabaaabaaac", "aabaaac")
//    let res = s.divide(101, 4)
//    let res = s.findSubstring("bcabbcaabbccacacbabccacaababcbb", ["c","b","a","c","a","a","a","b","c"])
//    var res = [1,3,2]
//    s.nextPermutation(&res)
//    let res = s.longestValidParentheses("()(()")
//    let res = s.search([4,5,6,7,0,1,2], 0)
//    let res = s.searchRange([5,7,7,8,8,10], 8)
//    let res = s.searchInsert([1,3,5,6], 0)
//    var board: [[Character]] = [[".",".",".",   "7","2",".",    "6","4","."],
//                                [".","7","6",   "1",".",".",    ".",".","3"],
//                                [".","4",".",   "8",".","5",    ".",".","2"],
//
//                                [".","9",".",   ".","4","8",    ".",".","."],
//                                [".",".",".",   ".",".",".",    ".",".","7"],
//                                [".",".",".",   ".","5",".",    ".","8","."],
//
//                                ["3",".",".",   ".",".","2",    ".",".","."],
//                                [".",".",".",   ".",".",".",    ".",".","5"],
//                                [".",".","8",   ".",".","6",    ".","3","."]]
//    let res = s.isValidSudoku(board)
//    s.solveSudoku(&board)
//    let res = s.countAndSay(5)
//    let res = s.combinationSum([2, 3, 4, 5], 10)
//    let res = s.combinationSum2([1,1,1,1,1,1,1,1,1,1,1], 27)
//    let res = s.firstMissingPositive([1,2,0])
//    let res = s.trap([0,1,0,2,1,0,1,3,2,1,2,1])
//    let res = s.multiply("3212", "578")
//    let res = s.wildcard_isMatch("adceb", "*a*b")
//    let res = s.jump([2,3,1,1,4])
//    let res = s.permute([2,3,1,1,4])
//    let res = s.permuteUnique([1,1,2])
//    var matrix = [[5,1,9,11],
//                  [2,4,8,10],
//                  [13,3,6,7],
//                  [15,14,12,16]]
//    s.rotate(&matrix)
//    let res = s.groupAnagrams(["eat", "tea", "tan", "ate", "nat", "bat"])
//    let res = s.groupAnagrams(["eat", "tea", "tan", "ate", "nat", "bat"])
//    let res = s.myPow(2.10000, 3)
//    let res = s.solveNQueens(7)
//    let res = s.totalNQueens(19)
//    let res = s.maxSubArray([-2,-1,-3,4,-1,2,1,-5,4])
//    let res = s.spiralOrder([[1,2,3,4],[5,6,7,8],[9,10,11,12]])
//    let res = s.canJump([3,2,1,0,4])
//    let res = s.merge([[1,4],[4,5]])
//    let res = s.insert([[1,2],[3,5],[6,7],[8,10],[12,16]], [4,8])
//    let res = s.lengthOfLastWord("   fly me   to   the moon  ")
//    let res = s.generateMatrix(4)
//    let res = s.getPermutation(5, 96)
//    let res = s.rotateRight(ListNode.format([1,2]), 1)
//    let res = s.uniquePaths(3, 7)
//    let res = s.uniquePathsWithObstacles([[1,0]])
//    let res = s.minPathSum([[1,2,3],[4,5,6]])
//    let res = s.isNumber("1E9")
//    let res = s.plusOne([9,9,9])
//    let res = s.addBinary("1010", "1011")
//    let res = s.fullJustify(["Science","is","what","we","understand","well","enough","to","explain","to","a","computer."], 20)
//    let res = s.mySqrt(26)
//    let res = s.climbStairs(3)
//    let res = s.simplifyPath("/a/../../b/../c//.//")
//    let res = s.minDistance("intention", "execution")
//    var res = [[0,1,2,0],[3,4,5,2],[1,3,1,5]]
//    s.setZeroes(&res)
//    let res = s.searchMatrix([[1,3,5,7],[10,11,16,20],[23,30,34,60]], 13)
//    let res = s.searchMatrix([[1, 3]], 3)
//    var res = [2,0,2,1,1,0]
//    s.sortColors(&res)
//    let res = s.minWindow("ADOBECODEBANC", "ABC")
//    let res = s.minWindow("aaaaaaaaaaaabbbbbcdd", "abcdd")
//    let res = s.minWindow("acbbaca", "aba")
//    let res = s.combine(4, 3)
//    let res = s.subsets([1, 2, 3])
//    let res = s.exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "SEEC")
//    var nums = [0,0,1,1,1,1,2,3,3]
//    let res = s.removeDuplicates_II(&nums)
//    let res = s.searchII([1,0,1,1,1], 0)
//    let res = s.searchII([1,3,5], 0)
//    let res = s.deleteDuplicates_ll(ListNode.format([2,2]))
//    let res = s.deleteDuplicates(ListNode.format([1,1,2,3,3]))
//    let res = s.largestRectangleArea([4,2,0,3,2,5])
//    let res = s.maximalRectangle([["0","0","0","0","0","0","1"],
//                                  ["0","0","0","0","1","1","1"],
//                                  ["1","1","1","1","1","1","1"],
//                                  ["0","0","0","1","1","1","1"]])
//    let res = s.partition(ListNode.format([1,4,3,2,5,2]), 3)
//    let res = s.isScramble("npfgmkuleygms", "ygksfmpngumle")
//    var res = [1,2,3,0,0,0]
//    s.merge(&res, 3, [2,5,6], 3)
//    let res = s.grayCode(3)
//    let res = s.subsetsWithDup([1,1])
//    let res = s.numDecodings("27")
//    let res = s.reverseBetween(ListNode.format([1,2,3,4,5]), 2, 4)
//    let n = TreeNode(nums: [5, 4, 7, 3, nil, 2, nil, -1, nil, 9])
    
//    let res = s.restoreIpAddresses("25525511135")
//    let res = s.inorderTraversal(TreeNode(nums: [1,nil,2,3]))
//    let res = s.generateTrees(5)
//    let res = s.numTrees(5)
//    let res = s.isInterleave("aabcc", "dbbca", "aadbbcbcac")
//    let res = s.isValidBST(TreeNode(nums: [5,1,4,nil,nil,3,6]))
//    let res = TreeNode(nums: [3,1,4,nil,nil,2])
//    s.recoverTree(res)
//    let res = s.isSameTree(TreeNode(nums: [1,2]), TreeNode(nums: [1,nil,2]))
//    let res = s.isSymmetric(TreeNode(nums: [7,-64,-64,-6,-90,-90,-6,88,-44,68,-65,-76,68,-44,88]))
//    let res = s.levelOrder(TreeNode(nums: [3,9,20,nil,nil,15,7]))
//    let res = s.zigzagLevelOrder(TreeNode(nums: [3,9,20,nil,nil,15,7]))
//    let res = s.maxDepth(TreeNode(nums: [3,9,20,nil,nil,15,7]))
//    let res = s.buildTree([9,3,15,20,7], [9,15,7,20,3])
//    let res = s.buildTree_II([9,3,15,20,7], [9,15,7,20,3])
//    let res = s.sortedArrayToBST([-10,-3,0,5,9])
//    let res = s.sortedListToBST(ListNode.format([-10,-3,0,5,9]))
//    let res = s.isBalanced(TreeNode(nums: [3,9,20,nil,nil,15,7]))
//    let res = s.minDepth(TreeNode(nums: [3,9,20,nil,nil,15,7]))
//    let res = s.hasPathSum(TreeNode(nums: [5,4,8,11,nil,13,4,7,2,nil,nil,nil,1]), 22)
//    let res = s.pathSum(TreeNode(nums: [5,4,8,11,nil,13,4,7,2,nil,nil,5,1]), 22)
//    let res = TreeNode(nums: [1,2,5,3,4,nil,6])
//    s.flatten(res)
//    let res = s.numDistinct("rabbbit", "rabbit")
//    let  res = s.connect(Node(nums: [1,2,3,4,5,6,7]))
//    let res = s.connect_II(Node(nums: [2,0,5,nil,-5,-1,nil,nil,5,5,7,nil,nil,0,-3,-9,nil,nil,8]))
//    let res = s.generate(5)
//    let res = s.getRow(3)
//    let res = s.minimumTotal([[2],[3,4],[6,5,7],[4,1,8,3]])
//    let res = s.maxProfit([7,1,5,3,6,4])
//    let res = s.maxProfit_II([7,1,5,3,6,4])
//    let res = s.maxProfit_III([1,2,4,2,5,7,2,4,9,0])
//    let res = s.maxPathSum(TreeNode(nums: [5,4,8,11,nil,13,4,7,2,nil,nil,nil,1]))
//    let res = s.isPalindrome("race a car")
//    let res = s.findLadders("leet", "code", ["lest","leet","lose","code","lode","robe","lost"])
//    let res = s.findLadders("qa", "sq", ["si","go","se","cm","so","ph","mt","db","mb","sb","kr","ln","tm","le","av","sm","ar","ci","ca","br","ti","ba","to","ra","fa","yo","ow","sn","ya","cr","po","fe","ho","ma","re","or","rn","au","ur","rh","sr","tc","lt","lo","as","fr","nb","yb","if","pb","ge","th","pm","rb","sh","co","ga","li","ha","hz","no","bi","di","hi","qa","pi","os","uh","wm","an","me","mo","na","la","st","er","sc","ne","mn","mi","am","ex","pt","io","be","fm","ta","tb","ni","mr","pa","he","lr","sq","ye"])
//    let res = s.ladderLength("hit", "cog", ["hot","dot","dog","lot","log","cog"])
//    let res = s.findLadders("ymain", "oecij", ["ymann","yycrj","oecij","ymcnj","yzcrj","yycij","xecij","yecij","ymanj","yzcnj","ymain"])
//    let res = s.ladderLength("ymain", "oecij", ["ymann","yycrj","oecij","ymcnj","yzcrj","yycij","xecij","yecij","ymanj","yzcnj","ymain"])


//    let res = s.ladderLength("qa", "sq", ["si","go","se","cm","so","ph","mt","db","mb","sb","kr","ln","tm","le","av","sm","ar","ci","ca","br","ti","ba","to","ra","fa","yo","ow","sn","ya","cr","po","fe","ho","ma","re","or","rn","au","ur","rh","sr","tc","lt","lo","as","fr","nb","yb","if","pb","ge","th","pm","rb","sh","co","ga","li","ha","hz","no","bi","di","hi","qa","pi","os","uh","wm","an","me","mo","na","la","st","er","sc","ne","mn","mi","am","ex","pt","io","be","fm","ta","tb","ni","mr","pa","he","lr","sq","ye"])
//    let res = s.longestConsecutive([0,3,7,2,5,8,4,6,0,1])
//    let res = s.sumNumbers(TreeNode(nums: [1,2,3]))
//    var res: [[Character]] = [["X","X","X","X"],["X","O","O","X"],["X","X","O","X"],["X","O","X","X"]]
//    s.solve(&res)
//    let res = s.partition("bb")
//    let res = s.minCut("ababababababababababababcbabababababababababababa")
//    let res = s.cloneGraph(Node(graghNums: [[2,4],[1,3],[2,4],[1,3]]))
//    let res = s.canCompleteCircuit([2,3,4], [3,4,3])
//    let res = s.candy([1,2,2])
//    let res = s.singleNumber([4,1,2,1,2,4,100])
    let res = s.singleNumber_II([-2,-2,1,1,4,1,4,4,-4,-2])
    print(res)
}

run()

