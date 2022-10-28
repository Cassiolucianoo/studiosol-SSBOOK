//
//  BookViewModel.swift
//  studiosol-SSBOOK
//
//  Created by cassio luciano on 28/10/22.
//

import Foundation


struct BookCellViewModel {
    private let book: Book
    
    init(_ book: Book) {
        self.book = book
    }
    
    var id: String { book.id }
    
    var title: String { book.title }
    
    var author: String { book.author }
    
    var imageURL: URL? { URL(string: book.cover) }
}
