//
//  LibraryViewTests.swift
//  WBooksTests
//
//  Created by Gabriel Mazzei on 07/05/2021.
//

@testable import WBooks
import XCTest
import SnapshotTesting
import SwiftUI

final class LibraryViewTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        isRecording = false
    }
    
    func testLibraryView() {
        let viewModel = LibraryViewModel(repository: BookRepositoryStub())
        let view = LibraryView(viewModel: viewModel)
        let controller = UIHostingController(rootView: view)
        assertSnapshot(matching: controller, as: .image(on: .iPhone8))
    }
}
