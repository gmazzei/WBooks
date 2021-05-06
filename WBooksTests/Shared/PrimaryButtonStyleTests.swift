//
//  PrimaryButtonStyleTests.swift
//  WBooksTests
//
//  Created by Gabriel Mazzei on 06/05/2021.
//

@testable import WBooks
import XCTest
import SnapshotTesting
import SwiftUI

final class PrimaryButtonStyleTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        isRecording = false
    }
    
    func testButtonStyle() {
        let view = VStack {
            Button("Example", action: {
                // No-op
            })
            .buttonStyle(PrimaryButtonStyle())
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.blue)
        
        let referenceFrame = view.frame(width: DeviceConstants.screenSize.width, height: DeviceConstants.screenSize.height)
        assertSnapshot(matching: referenceFrame, as: .image)
    }
    
}
