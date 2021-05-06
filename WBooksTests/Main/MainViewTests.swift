//
//  MainViewTests.swift
//  WBooksTests
//
//  Created by Gabriel Mazzei on 06/05/2021.
//

@testable import WBooks
import XCTest
import SnapshotTesting
import SwiftUI

final class MainViewTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        isRecording = false
    }
    
    func testMainView() {
        let view = MainView()
        let controller = UIHostingController(rootView: view)
        assertSnapshot(matching: controller, as: .image(on: .iPhone8))
    }
    
}
