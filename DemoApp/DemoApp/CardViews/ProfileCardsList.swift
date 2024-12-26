//
//  MatchCard.swift
//  DemoApp
//
// Created by Tejas Todkar on 26/12/24.
//

import SwiftUI

struct ProfileCardsList: View {
    @Binding var model: ContentModel
    @Environment(\.managedObjectContext) var viewContext
    var namespace: Namespace.ID
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            ProfileCard(model: $model, namespace: namespace)
                //.clipShape(RoundedRectangle(cornerRadius: 16))
                
        }
        .padding(.bottom, 8)
        .background(
            RoundedRectangle(cornerRadius: 16)
            .fill(Color.white)
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
        )
        .padding(.bottom, 16)
    }
}
