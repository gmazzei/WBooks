//
//  CommentViewTests.swift
//  WBooksTests
//
//  Created by Gabriel Mazzei on 09/05/2021.
//

@testable import WBooks
import XCTest
import SnapshotTesting
import SwiftUI

final class CommentViewTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        isRecording = false
    }
    
    func testCommentView() {
        let book = Book(title: "Title", author: "Author", image: "")
        let viewModel = CommentViewModel(book: book, repository: CommentRepositoryStub())
        let view = CommentView(viewModel: viewModel)
        let controller = UIHostingController(rootView: view)
        
        TestConstants.configurations.forEach { config in
            assertSnapshot(matching: controller, as: .image(on: config.device), named: config.name)
        }
    }
}
