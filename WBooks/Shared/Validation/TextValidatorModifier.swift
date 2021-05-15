//
//  TextValidatorModifier.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 12/05/2021.
//

import SwiftUI
import Combine

struct TextValidatorModifier<T>: ViewModifier where T: Equatable {
    
    @Binding var valid: Bool
    private let value: T
    private let condition: (T) -> Bool
    private let message: LocalizedStringKey
    
    init(for value: T, message: LocalizedStringKey, valid: Binding<Bool>, condition: @escaping (T) -> Bool) {
        self._valid = valid
        self.value = value
        self.message = message
        self.condition = condition
    }
    
    func body(content: Content) -> some View {
        VStack(alignment: .leading) {
            content
            Text(message)
                .font(.footnote)
                .foregroundColor(.red)
                .opacity(valid ? 0.0 : 1.0)
                .animation(.easeInOut(duration: 0.2))
        }
        .onChange(of: value, perform: {
            self.valid = condition($0)
        })
    }
}
