//
//  CommentRepositoryStub.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 09/05/2021.
//

final class CommentRepositoryStub: CommentRepositoryType {
    
    private let comments: [Comment] = [
        Comment(user: User(username: "John Smith", image: ""), content: "Nice book!"),
        Comment(user: User(username: "John Smith", image: ""), content: "Nice book!"),
        Comment(user: User(username: "John Smith", image: ""), content: "Nice book!"),
        Comment(user: User(username: "John Smith", image: ""), content: "Nice book!"),
        Comment(user: User(username: "John Smith", image: ""), content: "Nice book!"),
        Comment(user: User(username: "John Smith", image: ""), content: "Nice book!"),
        Comment(user: User(username: "John Smith", image: ""), content: "Nice book!"),
        Comment(user: User(username: "John Smith", image: ""), content: "Nice book!"),
    ]
    
    weak var delegate: CommentRepositoryTypeDelegate?
    
    func fetchComments(for book: Book) {
        delegate?.didFetchComments(comment: comments)
    }
    
}
