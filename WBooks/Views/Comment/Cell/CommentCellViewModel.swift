//
//  CommentViewModel.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 09/05/2021.
//

import Foundation

struct CommentCellViewModel: Identifiable {
    
    private(set) var id: UUID = UUID()
    private let comment: Comment
    
    init(comment: Comment) {
        self.comment = comment
    }
    
    // MARK: - Public interface
    
    var username: String {
        comment.user.username
    }
    
    var userImage: String {
        comment.user.image
    }
    
    var content: String {
        comment.content
    }
}
