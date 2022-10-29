//
//  CategoriesViewController.swift
//  studiosol-SSBOOK
//
//  Created by cassio luciano on 29/10/22.
//

import Foundation
import UIKit

class CategoriesViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    
    

    
    private let reuseIdentifier = "Category"
    
    private let categories = ["Todos", "Romance", "Aventura", "Comédia", "Terror", "Tecnologia", "Viagem"]

    override func viewDidLoad() {
        super.viewDidLoad()

    //    collectionView.dataSource = self
     //   collectionView.delegate = self
    }

}

extension CategoriesViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? CategoryCell else {
            return UICollectionViewCell()
        }

        cell.setupButton(category: categories[indexPath.row])
        cell.layer.borderWidth = CGFloat(0.5)
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.cornerRadius = 20.0

        return cell
    }

}

extension CategoriesViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

extension CategoriesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let item = categories[indexPath.row]
        let itemWidth = item.size(withAttributes: [
            NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 20)
        ]).width
        return CGSize(width: itemWidth + 40, height: 43)
    }
}
