//
//  CommentViewModel.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 09/05/2021.
//

import SwiftUI

final class CommentViewModel: ObservableObject, CommentRepositoryTypeDelegate {
    
    private let book: Book
    private var repository: CommentRepositoryType
    @Published private(set) var cellModels: [CommentCellViewModel]
    
    // MARK: - Initializers
    
    init(book: Book, repository: CommentRepositoryType = CommentRepository()) {
        self.book = book
        self.repository = repository
        self.cellModels = []
        self.repository.delegate = self
    }
    
    // MARK: - Public interface
    
    func fetchComment() {
        self.repository.fetchComments(for: book)
    }
    
    // MARK: - CommentRepositoryTypeDelegate
    
    func didFetchComments(comment: [Comment]) {
        cellModels = comment.map { CommentCellViewModel(comment: $0) }
    }
}
