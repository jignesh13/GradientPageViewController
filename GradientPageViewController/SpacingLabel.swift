//
//  SpacingLabel.swift
//  animationdemo
//
//  Created by fluxtech_macmini1 on 27/11/18.
//  Copyright © 2018 fluxtech_macmini1. All rights reserved.
//
import Foundation
import UIKit
@IBDesignable
class SpacingLabel: UILabel {
    @IBInspectable open var characterSpacing:CGFloat = 1 {
        didSet {
            let attributedString = NSMutableAttributedString(string: self.text!)
            attributedString.addAttribute(NSAttributedString.Key.kern, value: self.characterSpacing, range: NSRange(location: 0, length: attributedString.length))
            
            self.attributedText = attributedString
        }
        
    }
    @IBInspectable open var linespacing:CGFloat = 0 {
        didSet {
            let attributedString = NSMutableAttributedString(string: self.text!)
            let paragraphstyle = NSMutableParagraphStyle()
            paragraphstyle.lineSpacing=linespacing;
            
            paragraphstyle.alignment=self.textAlignment
            attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphstyle, range: NSRange(location: 0, length: attributedString.length))
            self.attributedText = attributedString
        }
        
    }
    
   
}
