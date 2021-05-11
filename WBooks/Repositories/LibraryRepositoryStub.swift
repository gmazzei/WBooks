//
//  LibraryRepositoryStub.swift
//  WBooksTests
//
//  Created by Gabriel Mazzei on 07/05/2021.
//

import Foundation

final class LibraryRepositoryStub: LibraryRepositoryType {
    
    private let books: [Book] = [
        Book(id: UUID(), title: "Book 1", author: "Author 1", image: "", year: 2021, genre: .novel),
        Book(id: UUID(), title: "Book 2", author: "Author 2", image: "", year: 2021, genre: .novel),
        Book(id: UUID(), title: "Book 3", author: "Author 3", image: "", year: 2021, genre: .novel),
        Book(id: UUID(), title: "Book 4", author: "Author 4", image: "", year: 2021, genre: .novel),
        Book(id: UUID(), title: "Book 5", author: "Author 5", image: "", year: 2021, genre: .novel),
    ]
    
    weak var delegate: LibraryRepositoryTypeDelegate?
    
    func fetchBooks() {
        delegate?.didFetchBooks(books: books)
    }
    
}
