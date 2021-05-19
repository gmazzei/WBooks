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
        static let lineColor: Color = Color(white: 0.9)
        static let errorColor: Color = .red
    }
    
    @ObservedObject private var viewModel: AddNewViewModel
    @State private var showImagePicker: Bool
    
    init(viewModel: AddNewViewModel) {
        self.viewModel = viewModel
        self.showImagePicker = false
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
                        showImagePicker.toggle()
                    }
                    .padding(.bottom, 32)
                    
                    VStack(spacing: 16) {
                        
                        VStack(alignment: .leading, spacing: 10) {
                            TextField("AddNewView.form.title", text: $viewModel.title)
                                    .disableAutocorrection(true)
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(Constants.lineColor)
                            
                            Text(viewModel.titleMessage)
                                .font(.footnote)
                                .foregroundColor(Constants.errorColor)
                                .frame(height: 16)
                        }
    
                        VStack(alignment: .leading, spacing: 10) {
                            TextField("AddNewView.form.author", text: $viewModel.author)
                                    .disableAutocorrection(true)
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(Constants.lineColor)
                            Text(viewModel.authorMessage)
                                .font(.footnote)
                                .foregroundColor(Constants.errorColor)
                                .frame(height: 16)
                        }
                        
                        VStack(alignment: .leading, spacing: 10) {
                            TextField("AddNewView.form.year", text: $viewModel.year)
                                    .disableAutocorrection(true)
                                    .keyboardType(.numberPad)
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(Constants.lineColor)
                            Text(viewModel.yearMessage)
                                .font(.footnote)
                                .foregroundColor(Constants.errorColor)
                                .frame(height: 16)
                        }
                        
                        NavigationLink(
                            destination: GenreView(viewModel: viewModel),
                            label: {
                                VStack(alignment: .leading, spacing: 10) {
                                    HStack {
                                        Text("AddNewView.form.genre")
                                        Spacer()
                                        Text(viewModel.genre.description)
                                            .foregroundColor(.black)
                                        Image(systemName: "chevron.right")
                                    }
                                    .foregroundColor(Color(white: 0.7))
                                    Rectangle()
                                        .frame(height: 1)
                                        .foregroundColor(Constants.lineColor)
                                }
                            }
                        )
                        
                    }
                    .padding(.bottom, 32)
                    
                    GradientButton("AddNewView.form.submit", isEnabled: viewModel.submitEnabled) {
                        viewModel.submit()
                    }
                }
                .padding(.horizontal, 26)
            }
            .padding(.top, 40)
            .padding(.bottom, 20)
        }
        .modifier(ProgressViewModifier(show: viewModel.showProgressView))
        .sheet(isPresented: $showImagePicker) {
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
