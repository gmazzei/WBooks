//
//  UIImage+Encode.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 11/05/2021.
//

import SwiftUI

extension UIImage {
    
    func encode() -> String {
        guard let data = pngData() else { return "" }
        return data.base64EncodedString(options: .lineLength64Characters)
    }
}
