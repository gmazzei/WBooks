//
//  YearTextValidatorModifier.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 12/05/2021.
//

import SwiftUI

struct YearTextValidatorModifier: ViewModifier {
    
    private let value: String
    
    init(for value: String) {
        self.value = value
    }
    
    func body(content: Content) -> some View {
        content
            .modifier(TextValidatorModifier(for: value, message: "YearTextValidatorModifier.error.message", condition: { text in
                guard let year = Int(text) else { return false }
                let currentYear = Calendar.current.component(.year, from: Date())
                return year <= currentYear
            }))
    }
}
