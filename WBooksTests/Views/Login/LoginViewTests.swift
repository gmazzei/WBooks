//
//  LoginViewTests.swift
//  WBooksTests
//
//  Created by Gabriel Mazzei on 06/05/2021.
//

@testable import WBooks
import XCTest
import SnapshotTesting
import SwiftUI

final class LoginViewTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        isRecording = false
    }
    
    func testLoginView() {
        let repository = LoginRepositoryStub()
        let viewModel = LoginViewModel(repository: repository)
        let view = LoginView(viewModel: viewModel)
        let controller = UIHostingController(rootView: view)
        
        TestConstants.configurations.forEach { config in
            assertSnapshot(matching: controller, as: .image(on: config.device), named: config.name)
        }
    }
    
}
