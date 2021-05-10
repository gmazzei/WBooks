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
    
    private let comments: [Comment] = [
        Comment(user: User(username: "John Smith", image: "https://images.booksense.com/images/499/282/9781788282499.jpg"), content: "Nice book!"),
        Comment(user: User(username: "John Smith", image: "https://images.booksense.com/images/499/282/9781788282499.jpg"), content: "Nice book!"),
        Comment(user: User(username: "John Smith", image: "https://images.booksense.com/images/499/282/9781788282499.jpg"), content: "Nice book!"),
        Comment(user: User(username: "John Smith", image: "https://images.booksense.com/images/499/282/9781788282499.jpg"), content: "Nice book!"),
        Comment(user: User(username: "John Smith", image: "https://images.booksense.com/images/499/282/9781788282499.jpg"), content: "Nice book!"),
        Comment(user: User(username: "John Smith", image: "https://images.booksense.com/images/499/282/9781788282499.jpg"), content: "Nice book!"),
        Comment(user: User(username: "John Smith", image: "https://images.booksense.com/images/499/282/9781788282499.jpg"), content: "Nice book!"),
        Comment(user: User(username: "John Smith", image: "https://images.booksense.com/images/499/282/9781788282499.jpg"), content: "Nice book!"),
    ]
    
    weak var delegate: CommentRepositoryTypeDelegate?
    
    func fetchComments(for book: Book) {
        delegate?.didFetchComments(comments: comments)
    }
    
}
