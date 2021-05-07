//
//  BookRepositoryStub.swift
//  WBooksTests
//
//  Created by Gabriel Mazzei on 07/05/2021.
//

@testable import WBooks

final class BookRepositoryStub: BookRepositoryType {
    
    private let books: [Book] = [
        Book(title: "Book 1", author: "Author 1", image: ""),
        Book(title: "Book 2", author: "Author 2", image: ""),
        Book(title: "Book 3", author: "Author 3", image: ""),
        Book(title: "Book 4", author: "Author 4", image: ""),
        Book(title: "Book 5", author: "Author 5", image: ""),
    ]
    
    weak var delegate: BookRepositoryTypeDelegate?
    
    func fetchBooks() {
        delegate?.didFetchBooks(books: books)
    }
    
}
