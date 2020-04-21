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

let one = TreeNode.init(1)
let two = TreeNode.init(2)
let three = TreeNode.init(3)
let four = TreeNode.init(4)
let five = TreeNode.init(5)
one.right = two
two.left = three
three.right = four
four.left = five

func inorderTraversal(_ root: TreeNode?) -> [Int] {
    if root == nil {
        return []
    }
    var left = inorderTraversal(root?.left)
    left.append(root?.val ?? 0)
    let right = inorderTraversal(root?.right)
    return left + right
}
print(inorderTraversal(one))

