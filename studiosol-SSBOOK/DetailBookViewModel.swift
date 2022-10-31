//
//  DetailBookViewModel.swift
//  studiosol-SSBOOK
//
//  Created by cassio luciano on 30/10/22.
//

import Foundation

class DetailBookViewModel {
    var webServices: WebServicesContract
    var book: Book
    
    var title: String { book.title }

    var author: String { book.author }

    var imageURL: URL? { URL(string: book.cover) }

    var description: String { book.description }

    var isFavorite: Bool { book.isFavorite ?? false }
    
    init(webServices: WebServicesContract = WebServices(), book: Book) {
        self.webServices = webServices
        self.book = book
    }
    
    func getBookDetails(completion: @escaping () -> ()) {
        webServices.loadBookDetails(id: book.id) { [weak self] bookDetails in
            self?.book.description = bookDetails.description
            self?.book.isFavorite = bookDetails.isFavorite
            completion()
        }
    }
    
}
