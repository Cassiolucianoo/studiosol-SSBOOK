//
//  AllBooksViewModel.swift
//  studiosol-SSBOOK
//
//  Created by cassio luciano on 29/10/22.
//

import Foundation

class AllBooksViewModel {
    var webServices: WebServicesContract
    var allBooks = [Book]()
    
    var numberOfRows: Int { allBooks.count }
    
    init(webServices: WebServicesContract = WebServices()) {
        self.webServices = webServices
    }
    
    func modelAt(_ index: Int) -> Book {
        allBooks[index]
    }
    
    func getAllBooks(completion: @escaping (String?) -> ()) {
        webServices.loadAllBooks() { [weak self] books, error in
            if let books = books {
                self?.allBooks = books.map { Book(book: $0) }
                completion(nil)
            } else {
                completion(error)
            }
            
        }
    }
}
