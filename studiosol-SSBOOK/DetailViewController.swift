//
//  detailViewController.swift
//  studiosol-SSBOOK
//
//  Created by cassio luciano on 30/10/22.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var imagem: UIImageView!
    @IBOutlet weak var tituloLb: UILabel!
    @IBOutlet weak var autorLb: UILabel!
    @IBOutlet weak var DecricaoLb: UILabel!
    @IBOutlet weak var detalhesView: UIView!
    @IBOutlet weak var favoritoBt: UIButton!
    
    @IBAction func voltar(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
            var detailVM: DetailBookViewModel?

            override func viewDidLoad() {
                super.viewDidLoad()
                
                setupDetailView()

                detailVM?.getBookDetails() { [weak self] in
                    self?.setup()
                }
            }
            
            private func setup() {
                guard let detailVM = detailVM else { return }
                
                let imageURL = detailVM.imageURL
                let placeholderImage = UIImage(named: "imagePlaceholder")
                imagem.sd_setImage(with: imageURL, placeholderImage: placeholderImage)
                
                tituloLb.text = detailVM.title
                
                autorLb.text = detailVM.author
                
                DecricaoLb.text = detailVM.description
                
                if !detailVM.isFavorite {
                    favoritoBt.imageView?.image = UIImage(named: "notfav")
                }
            }
            
            private func setupDetailView() {
                detalhesView.layer.shadowOffset = CGSize(width: 0,
                                                  height: -1)
                detalhesView.layer.shadowRadius = 1
                detalhesView.layer.shadowOpacity = 0.05
                
                detalhesView.layer.cornerRadius = 40
                detalhesView.layer.maskedCorners = [.layerMinXMinYCorner]
            }

        
        }
