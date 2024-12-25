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
                Button(action: {
                    withAnimation {
                        model.isAccepted = false
                    }
                }) {
                    ZStack {
                        Circle()
                            .stroke()
                            .stroke(.red, lineWidth: 1)
                            .frame(width: 52, height: 52)
                        Circle()
                            .frame(width: 50, height: 50)
                            .foregroundColor(Color.gray.opacity(0.1))
                            .overlay(
                                Image(systemName: "xmark")
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundColor(.red)
                            )
                    }
                }
                
                Spacer()
                
                Button(action: {
                    withAnimation {
                        model.isAccepted = true
                    }
                }) {
                    ZStack {
                        Circle()
                            .stroke()
                            .stroke(.green, lineWidth: 1)
                            .frame(width: 52, height: 52)
                        Circle()
                            .frame(width: 50, height: 50)
                            .foregroundColor(Color.gray.opacity(0.2))
                            .overlay(
                                Image(systemName: "checkmark")
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundColor(.green)
                            )
                    }
                }
            }
        }
    }
}
