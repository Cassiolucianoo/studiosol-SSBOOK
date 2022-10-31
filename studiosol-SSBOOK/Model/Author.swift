//
//  Author.swift
//  studiosol-SSBOOK
//
//  Created by cassio luciano on 28/10/22.
//

import Foundation

struct Author {
    var name: String
    var picture: String
    var booksCount: Int
    
    init(author: FavoriteAuthorsQuery.Data.FavoriteAuthor) {
        self.name = author.name
        self.picture = author.picture
        self.booksCount = author.booksCount
    }
}
