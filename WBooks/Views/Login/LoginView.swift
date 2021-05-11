//
//  LoginView.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 06/05/2021.
//

import SwiftUI

struct LoginView: View {
    
    private struct Constants {
        static let imageWidth: CGFloat = 150
        static let footnotePadding: CGFloat = 10
        static let stackSpacing: CGFloat = 40
    }
    
    @ObservedObject private var viewModel: LoginViewModel
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                
                VStack(spacing: Constants.stackSpacing) {
                    WBooksImages.wbooksImage
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: Constants.imageWidth)
                    
                    Button("LoginView.buttonTitle") {
                        viewModel.login()
                    }
                    .buttonStyle(PrimaryButtonStyle())
                    .fullScreenCover(isPresented: $viewModel.isLogged, content: {
                        MainView()
                    })
                }
                
                Spacer()
                
                Text("LoginView.bottomText")
                    .font(.footnote)
                    .padding(Constants.footnotePadding)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            WBooksImages.blueBackground
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
        )
    }
}

struct LoginView_Previews: PreviewProvider {
    
    static var previews: some View {
        LoginView(viewModel: LoginViewModel())
    }
}
