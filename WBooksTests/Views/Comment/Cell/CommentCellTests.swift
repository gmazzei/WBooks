//
//  CommentCellTests.swift
//  WBooksTests
//
//  Created by Gabriel Mazzei on 09/05/2021.
//

@testable import WBooks
import XCTest
import SnapshotTesting
import SwiftUI

final class CommentCellTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        isRecording = false
    }
    
    func testCommentCell() {
        let user = User(username: "John Smith", image: "")
        let book = Book(title: "Title", author: "Author", image: "", year: 2021, genre: .novel)
        let comment = Comment(user: user, book: book, content: "Nice book!")
        let viewModel = CommentCellViewModel(comment: comment)
        let view = CommentCell(viewModel: viewModel)
        let controller = UIHostingController(rootView: view)
        
        TestConstants.configurations.forEach { config in
            assertSnapshot(matching: controller, as: .image(on: config.device), named: config.name)
        }
    }
}
