//
//  File.swift
//  studiosol-SSBOOK
//
//  Created by cassio luciano on 29/10/22.
//

import Foundation

class FavoriteAuthorsViewModel {
    var webServices: WebServicesContract
    var favoriteAuthors = [Author]()
    
    var numberOfItems: Int { favoriteAuthors.count }
    
    init(webServices: WebServicesContract = WebServices()) {
        self.webServices = webServices
    }
    
    func modelAt(_ index: Int) -> Author {
        favoriteAuthors[index]
    }
    
    func getFavoriteAuthors(completion: @escaping (String?) -> ()) {
        webServices.loadFavoriteAuthors() { [weak self] authors, error in
            if let authors = authors {
                self?.favoriteAuthors = authors.map { Author(author: $0) }
                completion(nil)
            } else {
                completion(error)
            }
            
        }
    }
}

