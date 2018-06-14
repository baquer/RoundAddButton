//
//  RoundAddButton.swift
//  RoundAddButton
//
//  Created by Syed on 14/06/18.
//  Copyright © 2018 Syed. All rights reserved.
//

import Foundation

@IBDesignable
class RoundAddButton: UIButton {
    let button = UIButton()
    
    static var random: CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
    
    static func randomColor() -> UIColor {
        return UIColor(red:   random,
                       green: random,
                       blue:  random,
                       alpha: 1.0)
    }
    
    private struct Constants {
        static let plusLineWidth: CGFloat = 3.0
        static let plusButtonScale: CGFloat = 0.6
        static let halfPointShift: CGFloat = 0.5
    }
    
    private var halfWidth: CGFloat {
        return bounds.width / 2
    }
    
    private var halfHeight: CGFloat {
        return bounds.height / 2
    }
    
    
    @objc var fillColor: UIColor = randomColor()
    @IBInspectable var isAddButton: Bool = true
    
    override func draw(_ rect: CGRect)  {
        
        let path = UIBezierPath(ovalIn: rect)
        
        
        let scheduler = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(getter: RoundAddButton.fillColor), userInfo: nil, repeats: true)
        scheduler.fire()
        fillColor.setFill()
        path.fill()
        
        
        //set up the width and height variables
        //for the horizontal stroke
        let plusWidth: CGFloat = min(bounds.width, bounds.height) * Constants.plusButtonScale
        let halfPlusWidth = plusWidth / 2
        
        //create the path
        let plusPath = UIBezierPath()
        
        //set the path's line width to the height of the stroke
        plusPath.lineWidth = Constants.plusLineWidth
        
        //move the initial point of the path
        //to the start of the horizontal stroke
        plusPath.move(to: CGPoint(
            x: halfWidth - halfPlusWidth + Constants.halfPointShift,
            y: halfHeight + Constants.halfPointShift))
        
        //add a point to the path at the end of the stroke
        plusPath.addLine(to: CGPoint(
            x: halfWidth + halfPlusWidth + Constants.halfPointShift,
            y: halfHeight + Constants.halfPointShift))
        
        
        plusPath.move(to: CGPoint(
            x: halfWidth + Constants.halfPointShift,
            y: halfHeight - halfPlusWidth + Constants.halfPointShift))
        
        plusPath.addLine(to: CGPoint(
            x: halfWidth + Constants.halfPointShift,
            y: halfHeight + halfPlusWidth + Constants.halfPointShift))
        
        if isAddButton {
            //move the initial point of the path
            //to the start of the horizontal stroke
            plusPath.move(to: CGPoint(
                x: halfWidth - halfPlusWidth + Constants.halfPointShift,
                y: halfHeight + Constants.halfPointShift))
            
            //add a point to the path at the end of the stroke
            plusPath.addLine(to: CGPoint(
                x: halfWidth + halfPlusWidth + Constants.halfPointShift,
                y: halfHeight + Constants.halfPointShift))
        }
        
        //set the stroke color
        UIColor.white.setStroke()
        plusPath.stroke()
    }
}

