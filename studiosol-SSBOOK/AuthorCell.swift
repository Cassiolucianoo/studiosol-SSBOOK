//
//  AuthorCell.swift
//  studiosol-SSBOOK
//
//  Created by cassio luciano on 29/10/22.
//

import Foundation

import UIKit

class AuthorCell: UICollectionViewCell {

    
    @IBOutlet weak var nameLB: UILabel!
    @IBOutlet weak var numeroLivrosLB: UILabel!
    @IBOutlet weak var imagemView: UIImageView!
    
    
    var authorCellVM: AuthorCellViewModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure() {
        guard let authorCellVM = authorCellVM else { return }
        
        self.nameLB.text = authorCellVM.name
        
        let booksCount = authorCellVM.booksCount
        if booksCount == 1 {
            self.numeroLivrosLB.text = "\(booksCount) livro"
        } else {
            self.numeroLivrosLB.text = "\(booksCount) livros"
        }
        
        let imageURL = authorCellVM.imageURL
        let placeholderImage = UIImage(named: "imagePlaceholder")

        imagemView.sd_setImage(with: imageURL, placeholderImage: placeholderImage)
        
        self.layer.borderWidth = CGFloat(0.5)
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 10.0
    }
}
