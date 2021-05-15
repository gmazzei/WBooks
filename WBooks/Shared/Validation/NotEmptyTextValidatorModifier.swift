//
//  NotEmptyTextValidatorModifier.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 12/05/2021.
//

import SwiftUI

struct NotEmptyTextValidatorModifier: ViewModifier {
    
    private let value: String
    @Binding var valid: Bool
    
    init(for value: String, valid: Binding<Bool>) {
        self.value = value
        self._valid = valid
    }
    
    func body(content: Content) -> some View {
        content
            .modifier(TextValidatorModifier(for: value, message: "NotEmptyTextValidatorModifier.error.message", valid: $valid, condition: { !$0.isEmpty }))
    }
}
