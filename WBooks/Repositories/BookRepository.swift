//
//  BookRepository.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 07/05/2021.
//

protocol BookRepositoryType {
    var delegate: BookRepositoryTypeDelegate? { get set }
    func fetchBooks()
}

protocol BookRepositoryTypeDelegate: AnyObject {
    func didFetchBooks(books: [Book])
}

final class BookRepository: BookRepositoryType {
    
    weak var delegate: BookRepositoryTypeDelegate?
    
    func fetchBooks() {
        API.shared.fetchBooks(completion: { [weak self] books in
            self?.delegate?.didFetchBooks(books: books)
        })
    }
}
