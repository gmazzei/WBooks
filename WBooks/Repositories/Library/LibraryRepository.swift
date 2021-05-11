//
//  LibraryRepository.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 07/05/2021.
//

protocol LibraryRepositoryType {
    var delegate: LibraryRepositoryTypeDelegate? { get set }
    func fetchBooks()
}

protocol LibraryRepositoryTypeDelegate: AnyObject {
    func didFetchBooks(books: [Book])
}

final class LibraryRepository: LibraryRepositoryType {
    
    weak var delegate: LibraryRepositoryTypeDelegate?
    
    func fetchBooks() {
        API.shared.fetchBooks(completion: { [weak self] books in
            self?.delegate?.didFetchBooks(books: books)
        })
    }
}
