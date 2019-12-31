//
//  ViewController.swift
//  DrawWithFriend
//
//  Created by 陳姿穎 on 2019/12/27.
//  Copyright © 2019 陳姿穎. All rights reserved.
//

import UIKit

class Canvas: UIView {
    
    var lines = [[CGPoint]]()
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        context.setStrokeColor(UIColor(red: 10, green: 100, blue: 190).cgColor)
        context.setLineWidth(10)
        context.setLineCap(.round)
        
        lines.forEach { (line) in
            for (i, p) in line.enumerated() {
                if i == 0 {
                    context.move(to: p)
                } else {
                    context.addLine(to: p)
                }
            }
        }
        context.strokePath()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        lines.append([CGPoint]())
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let point = touches.first?.location(in: nil) else { return }
        
        guard var lastLine = lines.popLast() else { return }
        lastLine.append(point)
        lines.append(lastLine)
        
        setNeedsDisplay()
    }
}

class ViewController: UIViewController {

    let canvas = Canvas()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(canvas)
        canvas.backgroundColor = .white
        canvas.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height - 100)
        
    }

}

extension UIColor {
    
    convenience init(red: Int, green: Int, blue: Int) {
        let red = CGFloat(red) / 255.0
        let green = CGFloat(green) / 255.0
        let blue = CGFloat(blue) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
}

//[[(117.0, 235.66665649414062), (117.0, 235.66665649414062), (117.0, 235.66665649414062), (117.0, 235.66665649414062), (120.66665649414062, 245.66665649414062), (120.66665649414062, 246.0), (120.66665649414062, 246.66665649414062), (120.66665649414062, 247.0), (120.66665649414062, 247.66665649414062), (120.66665649414062, 248.3333282470703), (120.66665649414062, 249.0), (120.66665649414062, 249.66665649414062), (120.66665649414062, 250.3333282470703), (120.66665649414062, 251.66665649414062), (120.66665649414062, 252.3333282470703), (120.66665649414062, 254.0), (120.66665649414062, 254.3333282470703), (120.66665649414062, 255.3333282470703), (120.66665649414062, 256.0), (121.0, 257.0), (121.33332824707031, 257.3333282470703), (121.33332824707031, 257.6666564941406), (121.66665649414062, 258.3333282470703), (121.66665649414062, 259.0), (121.66665649414062, 259.6666564941406), (122.0, 260.3333282470703), (122.0, 261.0), (122.0, 261.3333282470703), (122.0, 262.0), (122.33332824707031, 262.6666564941406), (122.66665649414062, 263.3333282470703), (122.66665649414062, 264.0), (123.0, 264.3333282470703), (123.0, 264.6666564941406), (123.0, 265.0), (123.33332824707031, 265.0), (123.33332824707031, 265.3333282470703), (123.33332824707031, 265.3333282470703), (123.33332824707031, 265.3333282470703), (123.33332824707031, 265.3333282470703), (123.33332824707031, 265.3333282470703), (123.33332824707031, 265.3333282470703), (123.33332824707031, 265.3333282470703), (122.66665649414062, 265.3333282470703)], [(153.3333282470703, 513.6666564941406), (153.3333282470703, 513.6666564941406), (153.3333282470703, 513.6666564941406), (153.3333282470703, 513.6666564941406), (153.3333282470703, 513.6666564941406), (166.66665649414062, 506.6666564941406), (168.66665649414062, 506.6666564941406), (170.66665649414062, 506.3333282470703), (172.66665649414062, 506.0), (174.0, 505.0), (175.0, 504.6666564941406), (175.66665649414062, 504.6666564941406), (176.3333282470703, 504.6666564941406), (176.3333282470703, 504.6666564941406), (176.3333282470703, 504.6666564941406), (176.3333282470703, 504.6666564941406)]]
