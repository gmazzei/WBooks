//
//  CommentRepository.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 09/05/2021.
//

protocol CommentRepositoryType {
    var delegate: CommentRepositoryTypeDelegate? { get set }
    func fetchComments(for book: Book)
}

protocol CommentRepositoryTypeDelegate: AnyObject {
    func didFetchComments(comments: [Comment])
}

final class CommentRepository: CommentRepositoryType {
    
    weak var delegate: CommentRepositoryTypeDelegate?
    
    func fetchComments(for book: Book) {
        API.shared.fetchComments(for: book) { [weak self] comments in
            self?.delegate?.didFetchComments(comments: comments)
        }
    }
    
}
