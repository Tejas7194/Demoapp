//
//  MatchCardDescription.swift
//  DemoApp
//
// Created by Tejas Todkar on 26/12/24.
//

import SwiftUI

struct ProfileCard: View {
    @Binding var model: ContentModel
    var namespace: Namespace.ID
    
    var body: some View {
        VStack(alignment: .leading) {
                CardAysncImageView(viewModel: AsyncImageViewModel(imageAssest: model.image ?? ""))
                  
                    .cornerRadius(16, corners: [.topLeft, .topRight])
                    .clipped()
                    .matchedGeometryEffect(id: model.image ?? "", in: namespace)
                
                VStack(alignment: .leading) {
                    Text(model.fullName ?? "")
                        .font(.headline)
                        .lineLimit(1)
                
                    Text("\(model.dob ?? 0) Yrs")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.horizontal, 8)
            }
    }
}


extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat
    var corners: UIRectCorner
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}
