//
//  FavoriteBookViewCell.swift
//  studiosol-SSBOOK
//
//  Created by cassio luciano on 28/10/22.
//

import Foundation
import UIKit

class FavoriteBookViewCell: UICollectionViewCell {
    
    @IBOutlet weak var tituloLb: UILabel!
    @IBOutlet weak var AutorLb: UILabel!
    @IBOutlet weak var imagem: UIImageView!
    
    
    
    var bookCellVM: BookCellViewModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure() {
        guard let bookCellVM = bookCellVM else { return }
        
        self.tituloLb.text = bookCellVM.title
        
        self.AutorLb.text = bookCellVM.author
        
        let imageURL = bookCellVM.imageURL
        let placeholderImage = UIImage(named: "imagePlaceholder")

        imagem.sd_setImage(with: imageURL, placeholderImage: placeholderImage)
    }
    
    
}

