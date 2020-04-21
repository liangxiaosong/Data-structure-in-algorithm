//
//  ViewController.swift
//  二分法-开根号
//
//  Created by xj on 2020/3/24.
//  Copyright © 2020 xj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print(String(format: "%.6f", squareRoot(10)))
    }
    func squareRoot(_ number:Int) -> Double {
        var low:Double = 1.0
        let num:Double = Double(number)
        var hight:Double = Double(number)
        var quit:Bool = true
        var squaer:Double = 0.0
        var count = 0
        while quit {
            let mid = (hight - low)/2 + low
            //为什么不使用 mid * mid > num呢？主要是要堆站溢出
            if mid > num / mid {
                hight = mid
            }else if mid < num / mid {
                low = mid
            }else {
                squaer = mid
                quit = false
            }
            //hight - low < 0.000001 此处确保小数点后精确位数
            if hight - low < 0.000001 {
                quit = false
                squaer = mid
                break
            }
            count += 1
        }
        print(count)
        return squaer
    }

}

