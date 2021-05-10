//
//  CommentRepositoryStub.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 09/05/2021.
//

final class CommentRepositoryStub: CommentRepositoryType {
    
    private var comments: [Comment] {
        let user = User(username: "John Smith", image: "")
        let book = Book(title: "Title", author: "Author", image: "", year: 2021, genre: .novel)
        let comment = Comment(user: user, book: book, content: "Nice book!")
        return [Comment](repeating: comment, count: 20)
    }
    
    weak var delegate: CommentRepositoryTypeDelegate?
    
    func fetchComments(for book: Book) {
        delegate?.didFetchComments(comments: comments)
    }
    
}
