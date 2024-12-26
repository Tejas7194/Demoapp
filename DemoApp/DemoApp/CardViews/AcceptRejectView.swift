//
//  MatchCardBottomView.swift
//  DemoApp
//
// Created by Tejas Todkar on 26/12/24.
//

import SwiftUI


struct AcceptRejectView: View {
    @Binding var model: ContentModel
    
    var body: some View {
        ZStack {
            HStack {
                StylishTickMarkButton(model: $model, isChecked: false, imageName: "xmark")
                Spacer()
                StylishTickMarkButton(model: $model, isChecked: true, imageName: "checkmark")
            }
        }
    }
}


struct StylishTickMarkButton: View {
    @Binding var model: ContentModel
    var isChecked: Bool?
    @State var scaleEffect: Bool = false
    var imageName: String = ""
    var body: some View {
        Button(action: {
            withAnimation(.spring()) {
                model.isAccepted = isChecked
                scaleEffect = isChecked ?? false
            }
        }) {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(isChecked ?? false ? Color.green : Color.red)
                    .frame(width: 60, height: 60)
                    .shadow(color: Color.green.opacity(0.5), radius: 8, x: 0, y: 4)
                
                Image(systemName: imageName)
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.white)
                    .scaleEffect(scaleEffect ? 1.2 : 1.0)
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}
