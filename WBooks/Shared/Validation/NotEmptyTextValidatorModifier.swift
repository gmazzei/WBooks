//
//  NotEmptyTextValidatorModifier.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 12/05/2021.
//

import SwiftUI

struct NotEmptyTextValidatorModifier: ViewModifier {
    
    private let value: String
    
    init(for value: String) {
        self.value = value
    }
    
    func body(content: Content) -> some View {
        content
            .modifier(TextValidatorModifier(for: value, message: "NotEmptyTextValidatorModifier.error.message", condition: { !$0.isEmpty }))
    }
}
