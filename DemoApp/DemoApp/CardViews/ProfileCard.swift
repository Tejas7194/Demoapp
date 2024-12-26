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
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .bottom)) {
            ImageView(viewModel: AsyncImageViewModel(imageAssest: model.image ?? ""))
            
                .cornerRadius(16, corners: [.topLeft, .topRight])
                .clipped()
                .matchedGeometryEffect(id: model.image ?? "", in: namespace)
            if let isAccepted = model.isAccepted {
                VStack(spacing: 8) {
                    Text(isAccepted ? "Accepted" : "Declined")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(isAccepted ? LinearGradient(gradient: Gradient(colors: [Color.clear,Color.green.opacity(0.5),Color.green.opacity(1.0)]), startPoint: .top, endPoint: .bottom): LinearGradient(gradient: Gradient(colors: [Color.clear,Color.red.opacity(0.5),Color.red.opacity(1.0)]), startPoint: .top, endPoint: .bottom))
                        .animation(.spring(), value: isAccepted)
                }
            } else {
                AcceptRejectView(model: $model)
                    .padding(.horizontal)
                    .padding(.bottom)
                    .offset(y: UIScreen.main.bounds.width * 0.1)
            }
        }
        Spacer()
        VStack(alignment: .leading) {
                Text(model.fullName ?? "")
                    .font(.headline)
                    .lineLimit(1)
                
                Text("\(model.dob ?? 0) Yrs")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            
                Text(model.address ?? "")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            
        }
        .padding(.horizontal, 8)
        .padding(.top, 24)
        .padding(.bottom, 12)
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
