//
//  BookTableViewCell.swift
//  studiosol-SSBOOK
//
//  Created by cassio luciano on 29/10/22.
//

import Foundation
import UIKit


class BookTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imagemView: UIImageView!
    @IBOutlet weak var autor: UILabel!
    @IBOutlet weak var titulo: UILabel!
    
    var bookCellVM: BookCellViewModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure() {
        guard let bookCellVM = bookCellVM else { return }
        
        self.titulo.text = bookCellVM.title
        
        self.autor.text = bookCellVM.author
        
        let imageURL = bookCellVM.imageURL
        let placeholderImage = UIImage(named: "imagePlaceholder")

        imagemView.sd_setImage(with: imageURL, placeholderImage: placeholderImage)
    }
    
}
