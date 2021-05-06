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
        let referenceFrame = view.frame(width: DeviceConstants.screenSize.width, height: DeviceConstants.screenSize.height)
        
        assertSnapshot(matching: referenceFrame, as: .image)
    }
    
}
