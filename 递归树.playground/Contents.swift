import UIKit

public class TreeNode {
     public var val: Int
     public var left: TreeNode?
     public var right: TreeNode?
     public init(_ val: Int) {
         self.val = val
         self.left = nil
         self.right = nil
     }
 }

func generate_trees(_ start:Int,_ end: Int) -> [TreeNode?] {
    var all_trees = [TreeNode]()
    if start > end {
        return [nil]
    }
    
    for i in start ... end {
        let left_trees = generate_trees(start, i - 1)
        let right_trees = generate_trees(i+1, end)
        
        for left in left_trees {
            for right in right_trees {
                let current_tree = TreeNode.init(i)
                current_tree.left = left
                current_tree.right = right;
                all_trees.append(current_tree)
            }
        }
    }
    return all_trees
}

func generateTrees(_ n: Int) ->[TreeNode?] {
    if n == 0 {
        return []
    }
    return generate_trees(1, n)
}

var trees = generateTrees(0)
print(trees)



func numTrees(_ n: Int) -> Int {
    if n <= 1 {
        return 1
    }
    var c = [Int](repeating: 0, count: n + 1)
    c[0] = 1
    c[1] = 1
    for i in 2...n {
        for j in 1...i {
            c[i] += c[j - 1] * c[i - j]
        }
    }
    return c[n]
}
print(numTrees(1))
