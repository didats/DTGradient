//
//  DTGradientView.swift
//
//  Created by Didats Triadi on 7/26/17.
//  Copyright © 2017 Rimbunesia. All rights reserved.
//
//	License:
//	You are free to use on any project, including commercial project. 
//	You may not needed to mention my name. 
//	Just do what you want it to do, but please do not sell it.
//

import UIKit

@IBDesignable class DTGradientView: UIView {
    
    private var gradientLayer : CAGradientLayer = CAGradientLayer()
    
    @IBInspectable var fromColor: UIColor? {
        didSet {
            setGradient(from: fromColor!, to: toColor ?? UIColor.black)
        }
    }
    
    @IBInspectable var toColor: UIColor? {
        didSet {
            setGradient(from: fromColor ?? UIColor.black, to: toColor!)
        }
    }
    
    private func setGradient(from: UIColor, to: UIColor) {
        gradientLayer.frame = self.bounds
        gradientLayer.startPoint = CGPoint(x: 0, y: 1)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.colors = [from.cgColor, to.cgColor]
        gradientLayer.name = "gradient"
        
        addLayer()
    }
    
    private func addLayer() {
        var inserted : Bool = false
        if self.layer.sublayers != nil {
            for i in 0..<self.layer.sublayers!.count {
                let item = self.layer.sublayers![i]
                if item.name == "gradient" {
                    inserted = true
                    break
                }
            }
        }
        
        if !inserted {
            self.layer.insertSublayer(gradientLayer, at: 0)
        }
    }
    
    
}
