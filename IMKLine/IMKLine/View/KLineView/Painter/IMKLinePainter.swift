//
//  IMKLinePainter.swift
//  IMKLine
//
//  Created by 万涛 on 2017/12/20.
//  Copyright © 2017年 iMoon. All rights reserved.
//

import UIKit

class IMKLinePainter: NSObject {
    
    func draw(context: CGContext, kline: IMKLine) -> UIColor {
        let paintColor = kline.close < kline.open ? IMKLineTheme.DownColor : IMKLineTheme.RiseColor
        context.setStrokeColor(paintColor.cgColor)
        // 画 实体线(蜡烛)
        context.setLineWidth(IMKLineConfig.KLineWidth)
        context.strokeLineSegments(between: [kline.klinePosition.openPoint, kline.klinePosition.closePoint])
        // 画 上下影线
        context.setLineWidth(IMKLineConfig.KLineHatchedWidth)
        context.strokeLineSegments(between: [kline.klinePosition.highPoint, kline.klinePosition.lowPoint])
        
        return paintColor
    }
    
}