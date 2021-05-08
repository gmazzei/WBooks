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
        let items: [TabItem] = [
            TabItem(view: AnyView(Text("Item 1")), imageName: "", localizedKey: "MainView.tabItem.library"),
            TabItem(view: AnyView(Text("Item 2")), imageName: "", localizedKey: "MainView.tabItem.addNew")
        ]
        
        let view = MainView(items: items)
        let controller = UIHostingController(rootView: view)
        
        TestConstants.configurations.forEach { config in
            assertSnapshot(matching: controller, as: .image(on: config.device), named: config.name)
        }
    }
}
