//
//  TooltipView.swift
//  animationdemo
//
//  Created by fluxtech_macmini1 on 30/10/18.
//  Copyright © 2018 fluxtech_macmini1. All rights reserved.
//
import UIKit

@IBDesignable
class TooltipCustom: UIView {
    
    //MARK: - IBInspectable
    
    @IBInspectable var arrowTopLeft: Bool = false
    @IBInspectable var arrowTopCenter: Bool = false
    @IBInspectable var arrowTopRight: Bool = false
    @IBInspectable var arrowBottomLeft: Bool = false
    @IBInspectable var arrowBottomCenter: Bool = false
    @IBInspectable var arrowBottomRight: Bool = false
    
    @IBInspectable var fillColor: UIColor = UIColor.white
    @IBInspectable var gradientleft: UIColor = UIColor.red
    @IBInspectable var gradientright: UIColor = UIColor.blue

    @IBInspectable var borderColor: UIColor = UIColor(red:0, green:0, blue:0, alpha:0.05)
    @IBInspectable var borderRadius: CGFloat = 18
    @IBInspectable var borderWidth: CGFloat = 1
    
    @IBInspectable var shadowColor: UIColor = UIColor(red:0, green:0, blue:0, alpha:0.14)
    @IBInspectable var shadowOffsetX: CGFloat = 0
    @IBInspectable var shadowOpacity: CGFloat = 0.8
    @IBInspectable var shadowOffsetY: CGFloat = 2
    @IBInspectable var shadowBlur: CGFloat = 10
    
    @IBInspectable var enddistance: CGFloat = 0
   
    
    //MARK: - Global Variables
    
    var tooltipWidth: CGFloat  = 0.0
    var tooltipHeight: CGFloat = 0.0
    
    //MARK: - Initialization
    
    override func draw(_ rect: CGRect) {
        drawTooltip()
    }
    
    //MARK: - Private Methods
    
    // Orientation methods
    
    private func topLeft(_ x: CGFloat, _ y: CGFloat) -> CGPoint {
        return CGPoint(x: x, y: y)
    }
    
    private func topRight(_ x: CGFloat, _ y: CGFloat) -> CGPoint {
        return CGPoint(x: CGFloat(tooltipWidth) - x, y: y)
    }
    
    private func bottomLeft(_ x: CGFloat, _ y: CGFloat) -> CGPoint {
        return CGPoint(x: x, y: CGFloat(tooltipHeight) - y)
    }
    
    private func bottomRight(_ x: CGFloat, _ y: CGFloat) -> CGPoint {
        return CGPoint(x: CGFloat(tooltipWidth) - x, y: CGFloat(tooltipHeight) - y)
    }
    
    // Draw methods
    
    private func drawTooltip() {
    
        tooltipWidth = bounds.width
        tooltipHeight = bounds.height
        
        //    Define Bubble Shape
        //        guard let context = UIGraphicsGetCurrentContext() else {
        //            print("No context, handle me")
        //            return
        //        }
        //
        //        let gradientColor3 = UIColor.red
        //        let gradientColor4 = UIColor.blue
        //
        //        guard let sVGID_1_2 = CGGradient(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: [gradientColor3.cgColor, gradientColor4.cgColor] as CFArray, locations: [0, 1]) else {
        //            print("No gradient, handle me")
        //            context.restoreGState()
        //            return
        //        }
        
        //        context.saveGState()
        
        let bubblePath = UIBezierPath()
        //
        // Top left corner
        
        bubblePath.move(to: topLeft(0, borderRadius))
        bubblePath.addCurve(to: topLeft(borderRadius, 0), controlPoint1: topLeft(0, borderRadius / 2), controlPoint2: topLeft(borderRadius / 2, 0))
        
        // Top right corner
        
        bubblePath.addLine(to: topRight(borderRadius, 0))
        bubblePath.addCurve(to: topRight(0, borderRadius), controlPoint1: topRight(borderRadius / 2, 0), controlPoint2: topRight(0, borderRadius / 2))
        
        // Bottom right corner
        
        bubblePath.addLine(to: bottomRight(0, borderRadius))
        bubblePath.addCurve(to: bottomRight(borderRadius, 0), controlPoint1: bottomRight(0, borderRadius / 2), controlPoint2: bottomRight(borderRadius / 2, 0))
        
        // Bottom left corner
        
        bubblePath.addLine(to: bottomLeft(borderRadius, 0))
        bubblePath.addCurve(to: bottomLeft(0, borderRadius), controlPoint1: bottomLeft(borderRadius / 2, 0), controlPoint2: bottomLeft(0, borderRadius / 2))
        bubblePath.close()
        
        
        // Arrow
        
        if(arrowTopLeft) {
            bubblePath.move(to: topLeft(3, 10))
            bubblePath.addLine(to: topLeft(3, -4))
            bubblePath.addLine(to: topLeft(16, 2))
            bubblePath.close()
        }
        
        if(arrowTopCenter) {
            bubblePath.move(to: topLeft(CGFloat((tooltipWidth / 2) - 5), 5))
            bubblePath.addLine(to: topLeft(CGFloat(tooltipWidth / 2), 0))
            bubblePath.addLine(to: topLeft(CGFloat(tooltipWidth / 2 + 5), 5))
            bubblePath.close()
        }
        
        if(arrowTopRight) {
            bubblePath.move(to: topRight(16, 2))
            bubblePath.addLine(to: topRight(3, -4))
            bubblePath.addLine(to: topRight(3, 10))
            bubblePath.close()
        }
        
        if(arrowBottomLeft) {
            bubblePath.move(to: bottomLeft(16, 2))
            bubblePath.addLine(to: bottomLeft(3, -4))
            bubblePath.addLine(to: bottomLeft(3, 10))
            bubblePath.close()
        }
        
        if(arrowBottomCenter) {
            bubblePath.move(to: bottomLeft(CGFloat((tooltipWidth - enddistance) - 7), 0))
            bubblePath.addLine(to: bottomLeft(CGFloat(tooltipWidth - enddistance), -8))
            bubblePath.addLine(to: bottomLeft(CGFloat(tooltipWidth - enddistance + 7), 0))
            bubblePath.close()
        }
        
        if(arrowBottomRight) {
            bubblePath.move(to: bottomRight(3, 10))
            bubblePath.addLine(to: bottomRight(3, -4))
            bubblePath.addLine(to: bottomRight(16, 2))
            bubblePath.close()
        }
        
        
        let shadowShape = CAShapeLayer()
        shadowShape.path = bubblePath.cgPath
        shadowShape.frame = bubblePath.bounds
        
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowPath = bubblePath.cgPath
        self.layer.shadowOffset = CGSize(width: CGFloat(shadowOffsetX), height: CGFloat(shadowOffsetY))
        self.layer.shadowRadius = CGFloat(shadowBlur)
        self.layer.shadowOpacity = Float(shadowOpacity)
        // Border Layer
        
        let borderShape = CAShapeLayer()
        borderShape.path = bubblePath.cgPath
        borderShape.strokeColor = borderColor.cgColor
        borderShape.lineWidth = CGFloat(borderWidth*2)
        
        // Fill Layer
        
        let fillShape = CAShapeLayer()
        fillShape.path = bubblePath.cgPath
        fillShape.fillColor = fillColor.cgColor
        
        //  Add Sublayers
        
        let gradient=CAGradientLayer();
        gradient.frame=bubblePath.bounds;
        
        gradient.colors = [gradientleft.cgColor,
                           gradientright.cgColor]
        
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradient.mask = shadowShape
        // self.layer.addSublayer(gradient)
        self.layer.insertSublayer(gradient, at: 0)
       // self.layer.insertSublayer(borderShape, at: 0)
       // self.layer.insertSublayer(fillShape, at: 0)
        
        
    }
    
}
