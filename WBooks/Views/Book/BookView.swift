//
//  BookView.swift
//  WBooksTests
//
//  Created by Gabriel Mazzei on 10/05/2021.
//

import SwiftUI

struct BookView: View {
    
    private struct Constants {
        static let imageHeight: CGFloat = 120
        static let imageWidth: CGFloat = 84
        static let imageCornerRadius: CGFloat = 5
        
        static let columnSpacing: CGFloat = 12
        static let textSpacing: CGFloat = 5
        static let titleColor: Color = .black
        static let secondaryTextColor: Color = Color(white: 0.4)
        
        static let containerCornerRadius: CGFloat = 10
        static let containerShadow: CGFloat = 0.3
        static let containerPadding: EdgeInsets = EdgeInsets(top: 16, leading: 16,
                                                             bottom: 16, trailing: 16)
    }
    
    static var height: CGFloat {
        return Constants.imageHeight + Constants.containerPadding.top + Constants.containerPadding.bottom
    }
    
    static var spacing: CGFloat = 16
    
    private let viewModel: BookViewModel
    
    init(viewModel: BookViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        HStack(alignment: .top, spacing: Constants.columnSpacing) {
            ZStack {
                RemoteImage(url: viewModel.image)
                    .cornerRadius(Constants.imageCornerRadius)
                    .frame(width: Constants.imageWidth, height: Constants.imageHeight)
            }
            .aspectRatio(contentMode: .fill)
            .background(Color(white: 0.97))
            .cornerRadius(Constants.imageCornerRadius)
            
            
            VStack(alignment: .leading, spacing: Constants.textSpacing) {
                Text(viewModel.title)
                    .foregroundColor(Constants.titleColor)
                    .fontWeight(.bold)
                    .font(.title)
                    .fixedSize(horizontal: false, vertical: true)
                    .lineLimit(2)
                
                Text(viewModel.author)
                    .foregroundColor(Constants.secondaryTextColor)
                    .fontWeight(.light)
                    .fixedSize(horizontal: false, vertical: true)
                    .lineLimit(2)
                
                Text(viewModel.year.description)
                    .foregroundColor(Constants.secondaryTextColor)
                    .fontWeight(.light)
                
                Text(viewModel.genre)
                    .foregroundColor(Constants.secondaryTextColor)
                    .fontWeight(.light)
                
                Spacer()
            }
            
            Spacer()
        }
        .padding(Constants.containerPadding)
        .background(Color.white)
        .cornerRadius(Constants.containerCornerRadius)
        .shadow(radius: Constants.containerShadow)
        .frame(minHeight: BookView.height)
    }
}

struct BookView_Previews: PreviewProvider {
    private static var viewModel: BookViewModel {
        let book = Book(title: "Jane Eyre", author: "Charlotte Bronte",
                        image: "", year: 1847, genre: .novel)
        return BookViewModel(book: book)
    }
    
    static var previews: some View {
        BookView(viewModel: viewModel)
    }
}
