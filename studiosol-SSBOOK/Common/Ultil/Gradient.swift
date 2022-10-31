//
//  Gradient.swift
//  studiosol-SSBOOK
//
//  Created by cassio luciano on 30/10/22.
//

import UIKit

class GradientView: UIView {
    override open class var layerClass: AnyClass {
        return CAGradientLayer.classForCoder()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let gradientLayer = self.layer as? CAGradientLayer
        
        gradientLayer?.colors = [UIColor.black.withAlphaComponent(0.75).cgColor,
                                 UIColor.black.withAlphaComponent(0.0).cgColor]
        backgroundColor = UIColor.clear
    }
}
