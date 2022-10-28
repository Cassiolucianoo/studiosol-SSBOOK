//
//  FavoriteBooksViewModel.swift
//  studiosol-SSBOOK
//
//  Created by cassio luciano on 28/10/22.
//

import Foundation

class FavoriteBooksViewModel {
    var webServices: WebServicesContract
    var favoriteBooks = [Book]()
    
    init(webServices: WebServicesContract = WebServices()) {
        self.webServices = webServices
    }
    
    var numberOfItems: Int { favoriteBooks.count }
    
    func modelAt(_ index: Int) -> Book {
        favoriteBooks[index]
    }
    
    func getFavoriteBooks(completion: @escaping (String?) -> ()) {
        webServices.loadFavoriteBooks() { [weak self] (books, error) in
            if let books = books {
                self?.favoriteBooks = books.map { Book(book: $0) }
                completion(nil)
            } else {
                completion(error)
            }
        }
    }
}
