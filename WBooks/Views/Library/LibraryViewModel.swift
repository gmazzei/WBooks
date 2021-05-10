//
//  LibraryViewModel.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 06/05/2021.
//

import SwiftUI

final class LibraryViewModel: ObservableObject, BookRepositoryTypeDelegate {
    
    private var repository: BookRepositoryType
    @Published private var books: [Book]
    
    
    // MARK: - Initializers
    
    init(repository: BookRepositoryType = BookRepository()) {
        self.books = []
        self.repository = repository
        self.repository.delegate = self
    }
    
    // MARK: - Public interface
    
    func fetchBooks() {
        self.repository.fetchBooks()
    }
    
    var cellModels: [LibraryCellViewModel] {
        return books.map { LibraryCellViewModel(book: $0) }
    }
    
    // MARK: - BookRepositoryTypeDelegate
    
    func didFetchBooks(books: [Book]) {
        self.books = books
    }
}
