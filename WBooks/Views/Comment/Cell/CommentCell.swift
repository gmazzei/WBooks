//
//  CommentView.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 09/05/2021.
//

import SwiftUI

struct CommentCell: View {
    
    private struct Constants {
        static let imageSize: CGFloat = 64
        
        static let columnSpacing: CGFloat = 12
        static let textSpacing: CGFloat = 5
        static let usernameColor: Color = .black
        static let contentColor: Color = Color(white: 0.4)
        
        static let containerPadding: EdgeInsets = EdgeInsets(top: 16, leading: 16,
                                                             bottom: 16, trailing: 16)
    }
    
    static var height: CGFloat {
        return Constants.imageSize + Constants.containerPadding.top + Constants.containerPadding.bottom
    }
    
    static var spacing: CGFloat = 16
    
    private let viewModel: CommentCellViewModel
    
    init(viewModel: CommentCellViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        HStack(alignment: .top, spacing: Constants.columnSpacing) {
            ZStack {
                RemoteImage(url: viewModel.userImage)
                    .clipShape(Circle())
                    .frame(width: Constants.imageSize, height: Constants.imageSize)
            }
            .aspectRatio(contentMode: .fill)
            .background(Color(white: 0.97))
            .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: Constants.textSpacing) {
                Text(viewModel.username)
                    .foregroundColor(Constants.usernameColor)
                    .fontWeight(.bold)
                
                Text(viewModel.content)
                    .foregroundColor(Constants.contentColor)
                    .fontWeight(.light)
                    .fixedSize(horizontal: false, vertical: true)
                
                Spacer()
            }
            
            Spacer()
        }
        .padding(Constants.containerPadding)
        .background(Color.white)
        .frame(minHeight: CommentCell.height)
    }
}

struct CommentCell_Previews: PreviewProvider {
    private static var viewModel: CommentCellViewModel {
        let user = User(username: "John Smith", image: "https://images.booksense.com/images/499/282/9781788282499.jpg")
        let comment = Comment(user: user, content: "Nice book!")
        return CommentCellViewModel(comment: comment)
    }
    
    private static var viewModelLongText: CommentCellViewModel {
        let user = User(username: "John Smith John Smith John Smith", image: "")
        let comment = Comment(user: user, content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.")
        return CommentCellViewModel(comment: comment)
    }
    
    static var previews: some View {
        CommentCell(viewModel: viewModel)
        CommentCell(viewModel: viewModelLongText)
    }
}
