//
// TooltipView.swift
// Customizable Tooltips
//
// Copyright © 2017 Simon Wuyts
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import UIKit

@IBDesignable
class CustomizeBorderView: UIView {
    
    //MARK: - IBInspectable
    
    @IBInspectable var arrowTopLeft: Bool = false
    @IBInspectable var arrowTopCenter: Bool = false
    @IBInspectable var arrowTopRight: Bool = false
    @IBInspectable var arrowBottomLeft: Bool = false
    @IBInspectable var arrowBottomCenter: Bool = false
    @IBInspectable var arrowBottomRight: Bool = false
    @IBInspectable var isanimation: Bool = false

    @IBInspectable var fillColor: UIColor = UIColor.white
    
    @IBInspectable var borderColor: UIColor = UIColor(red:0, green:0, blue:0, alpha:0.05)
    @IBInspectable var borderRadius: CGFloat = 18
    @IBInspectable var borderWidth: CGFloat = 1
    @IBInspectable open var shineColor: UIColor = UIColor(white: 1.0, alpha: 1)
    @IBInspectable open var shineSpeed: Double = 0.7
    @IBInspectable var shadowColor: UIColor = UIColor(red:0, green:0, blue:0, alpha:0.14)
    @IBInspectable var shadowOffsetX: CGFloat = 0
    @IBInspectable var shadowOffsetY: CGFloat = 2
    @IBInspectable var shadowBlur: CGFloat = 10
    
    //MARK: - Global Variables
    
    var tooltipWidth = 0
    var tooltipHeight = 0
    
    //MARK: - Initialization
    
    override func draw(_ rect: CGRect) {
        roundCorners(corners: [.topLeft, .bottomRight], radius: borderRadius)

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
    

   private func roundCorners(corners: UIRectCorner, radius: CGFloat) {
    
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
         mask.path = path.cgPath
       layer.mask = mask
    if isanimation {
        self.performanimation()

    }

    }
    func performanimation() {
        let gradientLayer = CAGradientLayer()
         gradientLayer.frame = CGRect(x: 0, y: 0, width: 30, height: self.frame.height*4)
          gradientLayer.transform = CATransform3DMakeAffineTransform(CGAffineTransform(rotationAngle: CGFloat(.pi * 10.0 / 180.0)))
        gradientLayer.colors = [UIColor(displayP3Red: 1.0, green: 1.0, blue: 0, alpha: 0.02).cgColor, UIColor(displayP3Red: 1.0, green: 1.0, blue: 0, alpha: 0.4).cgColor,UIColor(displayP3Red: 1.0, green: 1.0, blue: 0, alpha: 0.02).cgColor]
        gradientLayer.masksToBounds = true
        gradientLayer.position = CGPoint(x: 0, y: -30)
        gradientLayer.anchorPoint = CGPoint(x: 0, y: 0)
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5);
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5);
        self.layer.insertSublayer(gradientLayer, at: 0)
        
        let x = CABasicAnimation(keyPath: "position.x")
        x.duration = shineSpeed
        
        x.fromValue = 0
        x.toValue = self.frame.size.width
        x.fillMode = CAMediaTimingFillMode.forwards
      
        
     
        let ag = CAAnimationGroup()
        ag.duration = shineSpeed
        ag.repeatCount = .infinity
        ag.animations = [x]
        ag.setValue(gradientLayer, forKey: "animationLayer")
        gradientLayer.add(ag, forKey: "position")
    }
   
}
