//
//  CategoryCell.swift
//  studiosol-SSBOOK
//
//  Created by cassio luciano on 29/10/22.
//

import Foundation
import UIKit

class CategoryCell: UICollectionViewCell {
    
    @IBOutlet weak var categoriaBt: UIButton!
    
    
    override func awakeFromNib() {
         super.awakeFromNib()
     }
    
    func setupButton(category: String) {
        categoriaBt.setTitle(" \(category) ", for: .normal)
        
        if category == "Todos" {
            categoriaBt.backgroundColor = UIColor(named: "#A076F2ff")
            categoriaBt.setTitleColor(.white, for: .normal)
        } else {
            categoriaBt.backgroundColor = .white
            categoriaBt.setTitleColor(UIColor(named: "#757575ff"), for: .normal)
        }
    }
    
}
