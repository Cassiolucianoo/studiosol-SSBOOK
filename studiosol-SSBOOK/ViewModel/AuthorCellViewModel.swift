//
//  AuthorCellViewModel.swift
//  studiosol-SSBOOK
//
//  Created by cassio luciano on 29/10/22.
//

import Foundation

class AuthorCellViewModel {
    private let author: Author
    
    init(_ author: Author) {
        self.author = author
    }
    
    var name: String { author.name }
    
    var booksCount: Int { author.booksCount }
    
    var imageURL: URL? { URL(string: author.picture) }
}
