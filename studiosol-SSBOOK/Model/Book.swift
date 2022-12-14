//
//  Book.swift
//  studiosol-SSBOOK
//
//  Created by cassio luciano on 28/10/22.
//

import Foundation
struct Book {
    var id: String
    var title: String
    var cover: String
    var author: String
    var description: String = ""
    var isFavorite: Bool?
    
    init(book: FavoriteBooksQuery.Data.FavoriteBook) {
        self.id = book.id
        self.title = book.name
        self.cover = book.cover
        self.author = book.author.name
        self.isFavorite = true
    }
    
    init(book: AllBooksQuery.Data.AllBook) {
        self.id = book.id
        self.title = book.name
        self.cover = book.cover
        self.author = book.author.name
    }
}
