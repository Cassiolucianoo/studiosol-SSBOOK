//
//  HomeViewController.swift
//  studiosol-SSBOOK
//
//  Created by cassio luciano on 27/10/22.
//

import Foundation
import UIKit
import SDWebImage

class HomeViewController: UIViewController{
    
    @IBOutlet weak var userImagem: UIImageView!
    @IBOutlet weak var autoresView: UIView!
    @IBOutlet weak var cabecalhoView: UIView!
    @IBOutlet weak var alturaDoConteiner: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        loadUserPicture()
    }

    private func setupView() {
        cabecalhoView.layer.shadowOffset = CGSize(width: 0,height: 1)
        cabecalhoView.layer.shadowRadius = 1
        cabecalhoView.layer.shadowOpacity = 0.05
        cabecalhoView.layer.cornerRadius = 40
        
        autoresView.layer.maskedCorners = [.layerMaxXMaxYCorner]
        autoresView.layer.cornerRadius = 40
        autoresView.layer.maskedCorners = [.layerMinXMinYCorner]
    }
    
    private func loadUserPicture() {
        WebServices().loadUserPicture() { [weak self] (picture) in
            let imageURL = URL(string: picture)
            let placeholderImage = UIImage(named:"imagePlaceholder")
            
            self?.userImagem.sd_setImage(with: imageURL, placeholderImage: placeholderImage)
        }
    }
    
    
    
}
