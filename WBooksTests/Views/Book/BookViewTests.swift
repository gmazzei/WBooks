//
//  BookViewTests.swift
//  WBooksTests
//
//  Created by Gabriel Mazzei on 10/05/2021.
//

@testable import WBooks
import XCTest
import SnapshotTesting
import SwiftUI

final class BookViewTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        isRecording = false
    }
    
    func testBookView() {
        let book = Book(title: "Title", author: "Author", image: "", year: 2021, genre: .novel)
        let viewModel = BookViewModel(book: book)
        let view = BookView(viewModel: viewModel)
        let controller = UIHostingController(rootView: view)
        
        TestConstants.configurations.forEach { config in
            assertSnapshot(matching: controller, as: .image(on: config.device), named: config.name)
        }
    }
}