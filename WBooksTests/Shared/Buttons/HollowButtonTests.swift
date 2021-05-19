//
//  HollowButtonTests.swift
//  WBooksTests
//
//  Created by Gabriel Mazzei on 19/05/2021.
//

@testable import WBooks
import XCTest
import SnapshotTesting
import SwiftUI

final class HollowButtonTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        isRecording = false
    }
    
    func testHollowButton() {
        let view = HollowButton("Button")
        let controller = UIHostingController(rootView: view)
        
        TestConstants.configurations.forEach { config in
            assertSnapshot(matching: controller, as: .image(on: config.device), named: config.name)
        }
    }
}
