//
//  UnderlinedTextViewModifier.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 13/05/2021.
//

import SwiftUI

struct UnderlinedTextViewModifier: ViewModifier {
    
    let color: Color
    
    func body(content: Content) -> some View {
        VStack {
            content
            Rectangle()
                .frame(height: 1)
                .foregroundColor(color)
        }
    }
    
}
