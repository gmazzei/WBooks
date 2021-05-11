//
//  TestConstants.swift
//  WBooksTests
//
//  Created by Gabriel Mazzei on 06/05/2021.
//

import Foundation
import UIKit
import SnapshotTesting

struct TestConstants {
    
    static let configurations: [TestConfiguration] = [TestConfiguration(name: "iPhone8_portrait", device: .iPhone8),
                                                      TestConfiguration(name: "iPhone8_landscape", device: .iPhone8(.landscape)),
                                                      TestConfiguration(name: "iPhoneX_portrait", device: .iPhoneX),
                                                      TestConfiguration(name: "iPhoneX_landscape", device: .iPhoneX(.landscape)),
                                                      TestConfiguration(name: "iPhoneSe_portrait", device: .iPhoneSe),
                                                      TestConfiguration(name: "iPhoneSe_landscape", device: .iPhoneSe(.landscape))]    
}

struct TestConfiguration {
    let name: String
    let device: ViewImageConfig
}
