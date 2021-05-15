//
//  AddNewView.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 06/05/2021.
//

import SwiftUI
import Combine

struct AddNewView: View {
    
    private struct Constants {
        static let formTopPadding: CGFloat = 32
        static let formBottomPadding: CGFloat = 20
        static let formHorizontalPadding: CGFloat = 20
    }
    
    @ObservedObject private var viewModel: AddNewViewModel
    
    init(viewModel: AddNewViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ScrollView {
            Group {
                VStack(alignment: .leading) {
                    ZStack {
                        Image(systemName: "plus.circle")
                            .resizable()
                            .foregroundColor(.white)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40)
                        
                        Image(uiImage: viewModel.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100)
                    }
                    .frame(width: 100, height: 100)
                    .background(WBooksColors.backgroundColor)
                    .cornerRadius(5)
                    .onTapGesture {
                        viewModel.showImagePicker.toggle()
                    }
                    .padding(.bottom, 30)
                    
                    VStack(spacing: 20) {
                        TextField("AddNewView.form.title", text: $viewModel.title)
                            .modifier(UnderlinedTextViewModifier(color: Color(white: 0.9)))
                            .modifier(NotEmptyTextValidatorModifier(for: viewModel.title, valid: $viewModel.titleIsValid))
                            .disableAutocorrection(true)
                        
                        TextField("AddNewView.form.author", text: $viewModel.author)
                            .modifier(UnderlinedTextViewModifier(color: Color(white: 0.9)))
                            .modifier(NotEmptyTextValidatorModifier(for: viewModel.author, valid: $viewModel.authorIsValid))
                            .disableAutocorrection(true)
                        
                        TextField("AddNewView.form.year", text: $viewModel.year)
                            .modifier(UnderlinedTextViewModifier(color: Color(white: 0.9)))
                            .modifier(YearTextValidatorModifier(for: viewModel.year, valid: $viewModel.yearIsValid))
                            .keyboardType(.numberPad)
                        
                        NavigationLink(
                            destination: GenreView(viewModel: viewModel),
                            label: {
                                HStack {
                                    Text("AddNewView.form.genre")
                                    Spacer()
                                    Text(viewModel.genre.description)
                                        .foregroundColor(.black)
                                    Image(systemName: "chevron.right")
                                }
                                .foregroundColor(Color(white: 0.7))
                                .modifier(UnderlinedTextViewModifier(color: Color(white: 0.9)))
                            })
                        
                    }
                    .padding(.bottom, 35)
                    
                    GradientButton("AddNewView.form.submit", isEnabled: viewModel.isSubmitEnabled) {
                        viewModel.submit()
                    }
                }
                .padding(.horizontal, 26)
            }
            .padding(.top, 40)
            .padding(.bottom, 20)
        }
        
        .sheet(isPresented: $viewModel.showImagePicker) {
            ImagePicker(image: $viewModel.image)
        }
        .navigationBarTitle("AddNewView.navigationView.title")
        .navigationBarTitleDisplayMode(.inline)
    }
    
}

struct AddNewView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddNewView(viewModel: AddNewViewModel())
        }
    }
}
