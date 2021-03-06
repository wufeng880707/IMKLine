//
//  IMKLineGroup.swift
//  IMKLine
//
//  Created by iMoon on 2017/12/20.
//  Copyright © 2017年 iMoon. All rights reserved.
//

import UIKit

public class IMKLineGroup: NSObject {

    public var klineArray = [IMKLine]()
    
    /* 此方法在项目中根据返回的数据结构实现
    static func klineArray(klineJsonArray: [JSON]) -> [IMKLine] {
        var klineArray = [IMKLine]()
        for klineJson in klineJsonArray {
            let kline = IMKLine.init(json: klineJson)
            klineArray.insert(kline, at: 0)
        }
        return klineArray
    }
     */
    
    public func insert(klineArray: [IMKLine]) {
        self.klineArray = klineArray + self.klineArray
        self.enumerateKlines()
    }
    
    public func insert(klineGroup: IMKLineGroup) {
        self.klineArray = klineGroup.klineArray + self.klineArray
        self.enumerateKlines()
    }
    
    public func enumerateKlines() {
        if self.klineArray.count == 0 {
            return
        }
        var prevKline = self.klineArray[0]
        prevKline.index = -1
        for kline in self.klineArray {
            kline.klineGroup = self
            kline.reset(prevKline: prevKline)
            prevKline = kline
        }
    }
    
    public func minTimeStamp() -> Double {
        if self.klineArray.count > 0 {
            return self.klineArray.first!.timeStamp
        }
        return Date().timeIntervalSince1970
    }
}
