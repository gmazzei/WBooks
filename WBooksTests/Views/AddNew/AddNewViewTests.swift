//
//  AddNewViewTests.swift
//  WBooksTests
//
//  Created by Gabriel Mazzei on 11/05/2021.
//

@testable import WBooks
import XCTest
import SnapshotTesting
import SwiftUI

final class AddNewViewTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        isRecording = false
    }
    
    func testAddNewView() {
        let repository = AddNewRepositoryStub()
        let viewModel = AddNewViewModel.init(repository: repository)
        let view = AddNewView(viewModel: viewModel)
        let controller = UIHostingController(rootView: view)
        
        TestConstants.configurations.forEach { config in
            assertSnapshot(matching: controller, as: .image(on: config.device), named: config.name)
        }
    }
}
