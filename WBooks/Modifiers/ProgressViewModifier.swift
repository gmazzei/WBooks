//
//  ProgressViewModifier.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 19/05/2021.
//

import SwiftUI

struct ProgressViewModifier: ViewModifier {
    
    private let show: Bool
    
    init(show: Bool) {
        self.show = show
    }
    
    func body(content: Content) -> some View {
        ZStack {
            content
                .allowsHitTesting(!show)
            
            ProgressView()
                .padding(12)
                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                .background(Color.black.opacity(0.5))
                .cornerRadius(3.0)
                .scaleEffect(1.5, anchor: .center)
                .opacity(show ? 1 : 0)
        }
    }
    
}

struct ProgressViewModifier_Previews: PreviewProvider {
    
    static var previews: some View {
        EmptyView()
            .modifier(ProgressViewModifier(show: true))
    }
}
