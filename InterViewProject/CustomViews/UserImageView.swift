//
//  UserImageView.swift
//  InterViewProject
//
//  Created by UW-IN-LPT0108 on 2/10/23.
//

import SwiftUI

struct UserImageView: View {
    @StateObject var viewModel = UserImageViewModel()
    let urlString: String
    
    var body: some View {
        Image(uiImage: UIImage(data: viewModel.imageData) ?? UIImage())
            .resizable()
            .aspectRatio(contentMode: .fit)
            .onAppear {
                viewModel.loadImage(using: urlString)
            }
    }
}
