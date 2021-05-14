//
//  HollowButton.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 13/05/2021.
//

import SwiftUI

struct HollowButton: View {
    
    private struct Constants {
        static let horizontalPadding: CGFloat = 20
        static let verticalPadding: CGFloat = 12
        static let lineWidth: CGFloat = 2
        static let disabledColor: Color = Color(white: 0.8)
    }
    
    private let localizedString: LocalizedStringKey
    private let mainColor: Color
    private let isEnabled: Bool
    private let action: () -> Void
    
    init(_ localizedString: LocalizedStringKey, mainColor: Color = .blue, isEnabled: Bool = true, action: @escaping () -> Void = {}) {
        self.localizedString = localizedString
        self.mainColor = mainColor
        self.isEnabled = isEnabled
        self.action = action
    }
    
    var body: some View {
        Button(action: action, label: {
            Text(localizedString)
                .frame(maxWidth: .infinity)
                .font(.body.bold())
                .textCase(.uppercase)
                .foregroundColor(isEnabled ? mainColor : Constants.disabledColor)
                .padding(.vertical, Constants.verticalPadding)
                .padding(.horizontal, Constants.horizontalPadding)
        })
        .background(Color.clear)
        .clipShape(Capsule())
        .overlay(
            Capsule()
                .stroke(isEnabled ? mainColor : Constants.disabledColor,
                        style: StrokeStyle(lineWidth: Constants.lineWidth))
        )
        .disabled(!isEnabled)
    }
    
}

struct HollowButton_Previews: PreviewProvider {
    static var previews: some View {
        HollowButton("Button") 
    }
}
