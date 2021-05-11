//
//  GradientButton.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 10/05/2021.
//

import SwiftUI

struct GradientButton: View {
    
    private struct Constants {
        static let horizontalPadding: CGFloat = 20
        static let verticalPadding: CGFloat = 12
        static let lineWidth: CGFloat = 2
        static let fontColor: Color = Color.white
        static let disabledColor: Color = Color(white: 0.8)
    }
    
    private let localizedString: LocalizedStringKey
    private let isEnabled: Bool
    private let action: () -> Void
    
    init(_ localizedString: LocalizedStringKey, isEnabled: Bool = true, action: @escaping () -> Void = {}) {
        self.localizedString = localizedString
        self.isEnabled = isEnabled
        self.action = action
    }
    
    var body: some View {
        Button(action: action, label: {
            Text(localizedString)
                .frame(maxWidth: .infinity)
                .font(.body.bold())
                .textCase(.uppercase)
                .foregroundColor(Constants.fontColor)
        })
        .padding(
            EdgeInsets(top: Constants.verticalPadding,
                       leading: Constants.horizontalPadding,
                       bottom: Constants.verticalPadding,
                       trailing: Constants.horizontalPadding)
        )
        .background(
            LinearGradient(gradient: Gradient(colors: isEnabled ? [WBooksColors.primaryBlue, WBooksColors.primaryGreen] : [Constants.disabledColor, Constants.disabledColor]), startPoint: .leading, endPoint: .trailing)
        )
        .clipShape(Capsule())
        .disabled(!isEnabled)
    }
}

struct GradientButton_Previews: PreviewProvider {
    static var previews: some View {
        GradientButton("Button")
    }
}
