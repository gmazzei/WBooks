//
//  CommentViewModel.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 09/05/2021.
//

import SwiftUI

final class CommentViewModel: ObservableObject, CommentRepositoryTypeDelegate {
    
    private struct Constants {
        static let maxElements: Int = 5
    }
    
    private let book: Book
    private var repository: CommentRepositoryType
    @Published private var comments: [Comment]
    @Published var showProgressView: Bool
    
    // MARK: - Initializers
    
    init(book: Book, repository: CommentRepositoryType = CommentRepository()) {
        self.comments = []
        self.showProgressView = false
        self.book = book
        self.repository = repository
        self.repository.delegate = self
    }
    
    // MARK: - Public interface
    
    func fetchComments() {
        self.showProgressView = true
        self.repository.fetchComments(for: book)
    }
    
    var cellModels: [CommentCellViewModel] {
        let size = min(comments.count, Constants.maxElements)
        let shownComments = comments.prefix(size)
        return shownComments.map { CommentCellViewModel(comment: $0) }
    }
    
    // MARK: - CommentRepositoryTypeDelegate
    
    func didFetchComments(comments: [Comment]) {
        self.comments = comments
        self.showProgressView = false
    }
}
