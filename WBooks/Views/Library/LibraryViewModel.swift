//
//  LibraryViewModel.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 06/05/2021.
//

import SwiftUI

final class LibraryViewModel: ObservableObject, LibraryRepositoryTypeDelegate {
    
    private var repository: LibraryRepositoryType
    @Published private var books: [Book]
    @Published var showProgressView: Bool
    
    // MARK: - Initializers
    
    init(repository: LibraryRepositoryType = LibraryRepository()) {
        self.books = []
        self.showProgressView = false
        self.repository = repository
        self.repository.delegate = self
    }
    
    // MARK: - Public interface
    
    func fetchBooks() {
        self.showProgressView = true
        self.repository.fetchBooks()
    }
    
    var cellModels: [LibraryCellViewModel] {
        return books.map { LibraryCellViewModel(book: $0) }
    }
    
    // MARK: - BookRepositoryTypeDelegate
    
    func didFetchBooks(books: [Book]) {
        self.books = books
        self.showProgressView = false
    }
}
