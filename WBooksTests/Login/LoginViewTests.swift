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
        let view = LoginView()
        let controller = UIHostingController(rootView: view)
        assertSnapshot(matching: controller, as: .image(on: .iPhone8))
    }
    
}
