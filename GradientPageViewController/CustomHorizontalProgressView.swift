//
//  CustomHorizontalProgressView.swift
//  animationdemo
//
//  Created by fluxtech_macmini1 on 19/11/18.
//  Copyright © 2018 fluxtech_macmini1. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class CustomHorizontalProgressView: UIView {
   @IBInspectable var progress: CGFloat = 80.0
    @IBInspectable var gradientleft: UIColor = UIColor.red
    @IBInspectable var gradientright: UIColor = UIColor.blue
    @IBInspectable var backgroundcolor: UIColor = UIColor.white

    var gradient: CAGradientLayer  = CAGradientLayer()
  
    
    func setup() {
        self.backgroundColor = UIColor.clear
        self.layer.cornerRadius = self.frame.height/2.0;
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.backgroundColor = backgroundcolor.cgColor
        self.layer.borderWidth = 0.0
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        setup()
        gradient=CAGradientLayer();
        gradient.frame=CGRect(x: 0, y: 0, width: 0, height: bounds.height)
        gradient.cornerRadius = bounds.height/2.0;
        gradient.colors = [gradientleft.cgColor,
                           gradientright.cgColor]
        gradient.position = CGPoint(x: 0, y: 0)
        gradient.anchorPoint = CGPoint(x: 0, y: 0.0)
        gradient.startPoint = CGPoint(x: 0.0, y: 0.9)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.9)
        self.layer.insertSublayer(gradient, at: 0)
        updateProgess(progess: progress)
    }
    
    public func updateProgess(progess: CGFloat) {
        self.progress = progess;
        let progress = self.progress
        
        let prevwidth  = gradient.bounds.width
        let width = ((frame.size.width)  * 80)/100.0
        let height = frame.size.height
        gradient.frame = CGRect(x: 0, y: 0, width: width, height: height);
     
        let gradientChangeLocation = CABasicAnimation(keyPath: "bounds.size.width")
        gradientChangeLocation.duration = 1.0
        gradientChangeLocation.fromValue=prevwidth
        gradientChangeLocation.toValue=width;
        gradientChangeLocation.fillMode = CAMediaTimingFillMode.forwards
        gradientChangeLocation.isRemovedOnCompletion = true

        gradient.add(gradientChangeLocation, forKey: "locationsChange")
  
    }
}
