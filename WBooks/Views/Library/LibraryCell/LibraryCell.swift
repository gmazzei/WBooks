//
//  LibraryCell.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 06/05/2021.
//

import SwiftUI

struct LibraryCell: View {
    
    private struct Constants {
        static let imageCornerRadius: CGFloat = 5
        static let imageWidth: CGFloat = 80
        static let imageHeight: CGFloat = 100
        static let imagePadding: EdgeInsets = EdgeInsets(top: 15, leading: 20,
                                                         bottom: 15, trailing: 10)
        
        static let textSpacing: CGFloat = 5
        static let titleColor: Color = Color(white: 0.3)
        static let authorColor: Color = Color(white: 0.4)
        static let textStackPadding: EdgeInsets = EdgeInsets(top: 15, leading: 0,
                                                             bottom: 15, trailing: 20)
        
        static let containerHeight: CGFloat = 100
        static let containerCornerRadius: CGFloat = 10
        static let containerShadow: CGFloat = 0.3
        
    }
    
    private let viewModel: LibraryCellViewModel
    
    init(viewModel: LibraryCellViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        HStack {
            RemoteImage(url: viewModel.image)
                .cornerRadius(Constants.imageCornerRadius)
                .aspectRatio(contentMode: .fit)
                .padding(Constants.imagePadding)
                .frame(width: Constants.imageWidth, height: Constants.imageHeight)
            
            VStack(alignment: .leading, spacing: Constants.textSpacing) {
                Text(viewModel.title)
                    .foregroundColor(Constants.titleColor)
                    .fontWeight(.bold)
                    .fixedSize(horizontal: false, vertical: true)
                    .lineLimit(2)
                
                Text(viewModel.author)
                    .foregroundColor(Constants.authorColor)
                    .fontWeight(.light)
                
                Spacer()
            }
            .padding()
            
            Spacer()
        }
        .background(Color.white)
        .cornerRadius(Constants.containerCornerRadius)
        .shadow(radius: Constants.containerShadow)
        .frame(height: Constants.containerHeight)
    }
}

struct LibraryCell_Previews: PreviewProvider {
    private static var viewModel: LibraryCellViewModel {
        let book = Book(title: "Jane Eyre",
                        author: "Charlotte Bronte",
                        image: "https://images.booksense.com/images/499/282/9781788282499.jpg")
        return LibraryCellViewModel(book: book)
    }
    
    static var previews: some View {
        LibraryCell(viewModel: viewModel)
    }
}
