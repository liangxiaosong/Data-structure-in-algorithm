//
//  ViewController.swift
//  算法-计数排序
//
//  Created by xj on 2020/3/22.
//  Copyright © 2020 xj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var a: [Int] = [2,5,3,0,2,3,0,3]
        print(countingSort(&a))
        
        // 小数组的测试
        var array: [Int] = [0,190, 4242, 2, 9, 912, 101, 55, 67, 89, 32]
        print(radixSort(&array))
        
        
    }
    ///计数排序
    func countingSort(_ numberArr: inout [Int]) -> [Int] {
        if numberArr.count <= 1 {
            return numberArr
        }
        ///查找数组中数据的范围
        var maxNum: Int = numberArr[0]
        for num in numberArr {
            if num > maxNum {
                maxNum = num
            }
        }
        ///申请一个计数数组c，下标大小[0,max]
        var c = [Int](repeating: 0, count: maxNum + 1)
        // 计算每个元素的个数，放入c中
        for i in 0..<numberArr.count {
            c[numberArr[i]] += 1
        }
        // 依次累加
        //c[k]中存储的数据小于等于k的个数
        for i in 1..<c.count {
            c[i] = c[i-1] + c[i];
        }
        // 临时数组r，存储排序之后的结果
        var r = [Int](repeating: 0, count: numberArr.count)
        // 计算排序的关键步骤，有点难理解
        /*
         比如，当扫描到 3 时，我们可以从数组 C 中取出下标为 3 的值 7，也就是说，到目前为止，包括自己在内，分数小于等于 3 的考生有 7 个，也就是说 3 是数组 R 中的第 7 个元素（也就是数组 R 中下标为 6 的位置）。当 3 放入到数组 R 中后，小于等于 3 的元素就只剩下了 6 个了，所以相应的 C[3]要减 1，变成 6
         */
        for num in numberArr {
            let index = c[num] - 1
            r[index] = num
            c[num] -= 1
        }
        // 将结果拷贝给numberArr数组
        numberArr.removeAll()
        for item in r {
            numberArr.append(item)
        }
        return numberArr
    }
    ///基数排序
     //2、计算无序序列中最大的那个数
    /*
     取基数入桶出桶的次数以此最大数值的位数为准
     */
    private func listMaxItem(_ list : Array<Int>)->Int{
        var maxNumber = list[0]
        for item in list {
            if maxNumber < item {
                maxNumber = item
            }
        }
        return maxNumber
    }
    //3、获取数字的长度----即取基数的次数
    private func numberLength(_ num : Int)->Int{
        return "\(num)".count
    }
    
    func radixSort(_ list : inout Array<Int>) -> Array<Int> {
        //基数
        let radix = 10
        var index: Int
        var digit = 1
        let maxNum = listMaxItem(list)
        let count = numberLength(maxNum)
        
        for _ in 0..<count {
            var buckets: [[Int]] = []  // 我们的排序子程序是桶排序，所以让我们预定义我们的桶
            
            for _ in 1...radix {
                buckets.append([])
            }
            
            for number in list {
                index = number / digit
                buckets[index % radix].append(number)
            }
            
            var i = 0
            
            for j in 0..<radix {
                let bucket = buckets[j]
                for number in bucket {
                    list[i] = number
                    i += 1
                }
            }
            
            digit *= radix
        }
        return list
    }
    
    
}

