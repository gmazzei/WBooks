//
//  GradientButtonTests.swift
//  WBooksTests
//
//  Created by Gabriel Mazzei on 19/05/2021.
//

@testable import WBooks
import XCTest
import SnapshotTesting
import SwiftUI

final class GradientButtonTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        isRecording = false
    }
    
    func testGradientButtonEnabled() {
        let view = GradientButton("Button")
        let controller = UIHostingController(rootView: view)
        
        TestConstants.configurations.forEach { config in
            assertSnapshot(matching: controller, as: .image(on: config.device), named: config.name)
        }
    }
    
    func testGradientButtonDisabled() {
        let view = GradientButton("Button", isEnabled: false)
        let controller = UIHostingController(rootView: view)
        
        TestConstants.configurations.forEach { config in
            assertSnapshot(matching: controller, as: .image(on: config.device), named: config.name)
        }
    }
}
