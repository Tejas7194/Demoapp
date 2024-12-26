//
//  CardAysncImageView.swift
//  DemoApp
//
// Created by Tejas Todkar on 26/12/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageView: View {
    var viewModel: AsyncImageViewModel
    
    var body: some View {
        if viewModel.checkToDownloadImage() {
            WebImage(url: URL(string: viewModel.imageAssest)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipped()
            } placeholder: {
                PlaceholderView(imageName: viewModel.placeholderImage)
            }
        } else if !viewModel.imageAssest.isEmpty {
            Image(viewModel.imageAssest)
                .resizable()
        } else {
            PlaceholderView(imageName: viewModel.placeholderImage)
        }
    }
}

struct PlaceholderView: View {
    let imageName: String
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.white
                let size = min(geometry.size.width * 0.7, geometry.size.height * 0.7)
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .clipped()
                    .frame(width: size, height: size)
                    .background(.clear)
            }
        }
    }
}
