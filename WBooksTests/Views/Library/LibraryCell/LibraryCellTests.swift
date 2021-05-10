//
//  LibraryCellTests.swift
//  WBooksTests
//
//  Created by Gabriel Mazzei on 07/05/2021.
//

@testable import WBooks
import XCTest
import SnapshotTesting
import SwiftUI

final class LibraryCellTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        isRecording = false
    }
    
    func testLibraryCell() {
        let book = Book(title: "Title", author: "Author", image: "", year: 2021, genre: .novel)
        let viewModel = LibraryCellViewModel(book: book)
        let view = LibraryCell(viewModel: viewModel)
        let controller = UIHostingController(rootView: view)
        
        TestConstants.configurations.forEach { config in
            assertSnapshot(matching: controller, as: .image(on: config.device), named: config.name)
        }
    }
}
