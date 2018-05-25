//
//  DrawFSwithPercent.swift
//  fanShapeWithPercent
//
//  Created by Tyobigoro on 2018/05/25.
//  Copyright © 2018年 Tyobigoro. All rights reserved.
//

import UIKit

class DrawFSLineWithPercent {
    // パーセントの円弧のパスを作る
    func arcPercent(_ radius: CGFloat, _ percent: Double) -> UIBezierPath {
        let endAngle = 2 * Double.pi * percent / 100 - Double.pi / 2
        let path = UIBezierPath(
            arcCenter: CGPoint(x: 0, y: 0),
            radius: radius,
            startAngle: CGFloat(-Double.pi / 2),
            endAngle: CGFloat(endAngle),
            clockwise: percent > 0
        )
        return path
    }
    //
    func drawLine(
        view: UIView,
        linewidth: CGFloat,
        lineColor: UIColor,
        radius: CGFloat,
        percent: Double
        ) -> UIImageView {
        
        // イメージ処理の開始
        let size = view.bounds.size
        UIGraphicsBeginImageContextWithOptions(size, false, 1.0)
        let percent = percent
        // 円弧のパスを作る
        lineColor.setStroke() // 青の線にする
        let arcPath = arcPercent(radius, percent)
        arcPath.lineWidth = linewidth
        arcPath.lineCapStyle = .butt
        // パスを平行移動する
        let tf = CGAffineTransform(translationX: view.center.x, y: view.center.y)
        arcPath.apply(tf)
        arcPath.stroke()
        // イメージテキストからUIImageを作る
        let image = UIGraphicsGetImageFromCurrentImageContext()
        // イメージ処理の終了
        UIGraphicsEndImageContext()
        let imageView = UIImageView(image: image)
        
        return imageView
    }
    
}
