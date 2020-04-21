//
//  ViewController.swift
//  堆操作
//
//  Created by xj on 2020/4/21.
//  Copyright © 2020 xj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var itemArr = [Int]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.itemArr = [7,5,19,8,4,1,20,13,16]
        self.itemArr = buildHeap(&self.itemArr, self.itemArr.count)
        for item in self.itemArr {
            print(item)
        }
        print("---------------------------")
        insert(&self.itemArr, 21)
        for item in self.itemArr {
            print(item)
        }
//        removeHeapTopItem(&self.itemArr)
//        print("---------------------------")
//        for item in self.itemArr {
//            print(item)
//        }
        
        sort(&self.itemArr, self.itemArr.count)
        print("---------------------------")
        for item in self.itemArr {
            print(item)
        }
    }
    
    func removeHeapTopItem(_ a:inout [Int]) {
        a.removeFirst()
        a.insert(a[a.count - 1], at: 0);
        a.removeLast()
        var index = 0
        headpify(&a, a.count, &index)
    }

    func buildHeap(_ a:inout [Int],_ n : Int) ->[Int] {
        for var index in (0...n/2).reversed() {
            headpify(&a, n, &index)
        }
        return a
    }

    func headpify(_ a:inout [Int],_ n: Int,_ i:inout Int) {
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
    
    func insert(_ n:inout [Int],_ data:Int) {
        n.append(data)
        var i = n.count - 1
        while (i + 1)/2 - 1 >= 0 && n[i] > n[(i + 1)/2 - 1] {
            n.swapAt(i, (i + 1)/2 - 1)
            i = (i + 1)/2 - 1
        }
    }
    
    func sort(_ a:inout [Int],_ n:Int)  {
        a = buildHeap(&a, a.count)
        var k = a.count - 1;
        while k > 1 {
            a.swapAt(0, k)
            k -= 1
            var index = 0
            headpify(&a, k, &index)
        }
        
    }
    
    
}

