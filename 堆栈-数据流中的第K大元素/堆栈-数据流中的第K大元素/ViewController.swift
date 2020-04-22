//
//  ViewController.swift
//  堆栈-数据流中的第K大元素
//
//  Created by xj on 2020/4/22.
//  Copyright © 2020 xj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    /*
     题目要求：设计一个找到数据流中第K大元素的类（class）。注意是排序后的第K大元素，不是第K个不同的元素。

     你的 KthLargest 类需要一个同时接收整数 k 和整数数组nums 的构造器，它包含数据流中的初始元素。每次调用 KthLargest.add，返回当前数据流中第K大的元素。
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        let nums:[Int] = [4,5,8,2]
        let kth = KthLargest.init(3, nums)
        print(kth.add(3))
        print(kth.add(5))
        print(kth.add(10))
        print(kth.add(9))
        print(kth.add(4))
    }
}

class KthLargest {
    
    ///大顶堆数组
    var maxPods = [Int]()
    ///小顶堆数组
//    var minPods = [Int]()
    var k:Int
    
    init(_ k: Int, _ nums: [Int]) {
        self.k = k
        
        let numbers = nums.sorted(by:<)
        if numbers.count > k {
            for item in numbers.count - k ... numbers.count - 1 {
                self.maxPods.append(numbers[item])
            }
            buildHeadp(&self.maxPods);
//            for item in 0..<(numbers.count - k) {
//                self.minPods.append(numbers[item]);
//            }
//            buildHeadp(&self.minPods)
        }else {
            for item in nums {
                self.maxPods.append(item)
            }
            buildHeadp(&self.maxPods);
        }
    }
    ///堆化
    private func buildHeadp(_ n:inout [Int]) {
        for var index in (0..<n.count/2).reversed() {
            headpify(&n, n.count, &index)
        }
    }
    ///堆序列 - 小顶堆
    private func headpify(_ a:inout [Int],_ n: Int,_ i:inout Int) {
        while true {
            var maxPos = i
            if (i + 1) * 2 - 1 < n && a[i] > a[(i + 1) * 2 - 1] {
                maxPos = (i + 1) * 2 - 1;
            }
            if (i + 1) * 2 < n && a[maxPos] > a[(i + 1) * 2] {
                maxPos = (i + 1) * 2
            }
            if maxPos == i {
                break
            }
            a.swapAt(i, maxPos)
            i = maxPos
        }
    }
    /*
    ///堆序列 - 大顶堆
    private func headpifyMin(_ a:inout [Int],_ n: Int,_ i:inout Int) {
        while true {
            var maxPos = i
            if (i + 1) * 2 - 1 < n && a[i] < a[(i + 1) * 2 - 1] {
                maxPos = (i + 1) * 2 - 1;
            }
            if (i + 1) * 2 < n && a[maxPos] < a[(i + 1) * 2] {
                maxPos = (i + 1) * 2
            }
            if maxPos == i {
                break
            }
            a.swapAt(i, maxPos)
            i = maxPos
        }
    }
    */
    ///插入元素
    private func insert(_ n:inout [Int],_ data:Int) {
        n.append(data)
        var i = n.count - 1
        while (i + 1)/2 - 1 >= 0 && n[i] < n[(i + 1)/2 - 1] {
            n.swapAt(i, (i + 1)/2 - 1)
            i = (i + 1)/2 - 1
        }
    }
    
    ///删除堆顶元素
    private func removeHeapTopItem(_ a:inout [Int]) {
        a.removeFirst()
        a.insert(a[a.count - 1], at: 0);
        a.removeLast()
        var index = 0
        headpify(&a, a.count, &index)
    }
    
    public func add(_ val: Int) -> Int {
        if val > self.maxPods.first ?? NSIntegerMax || self.maxPods.count < self.k {
            if self.maxPods.count >= self.k {
//                self.minPods.append(self.maxPods[0])
                removeHeapTopItem(&self.maxPods)
            }
            insert(&self.maxPods, val)
        }
//        else {
//            self.minPods.append(val)
//        }
        return self.maxPods.first ?? NSIntegerMax
    }
}
