//
//  FavoriteAuthorsViewController.swift
//  studiosol-SSBOOK
//
//  Created by cassio luciano on 29/10/22.
//

import Foundation
import UIKit

class FavoriteAuthorsViewController: UIViewController {
    
    @IBOutlet private var collectionView: UICollectionView!
    
    
    private let reuseIdentifier = "Author"
    private let favoriteAuthorsVM = FavoriteAuthorsViewModel()
    weak var delegate: ShowAlertProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        getFavoriteAuthors()
    }
    
    private func getFavoriteAuthors() {
        favoriteAuthorsVM.getFavoriteAuthors { [weak self] (error) in
            if let error = error {
                guard let alert = self?.fetchAlert(title: "Erro ao carregar autores favoritos", message: error) else {return}
                self?.delegate?.alert(alert)
            } else {
                self?.collectionView.reloadData()
            }
        }
    }
}

extension FavoriteAuthorsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favoriteAuthorsVM.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? AuthorCell else {
            return UICollectionViewCell()
        }
        
        let author = favoriteAuthorsVM.modelAt(indexPath.row)
        cell.authorCellVM = AuthorCellViewModel(author)
        
        cell.configure()
        
        return cell
    }
    
}

extension FavoriteAuthorsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
    
}
