//
//  ContentView.swift
//  DemoApp
//
//  Created by Tejas Todkar on 25/12/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var viewModel: ContentViewModel
    @State var showNavigation: Bool = false
    @State var selected: ContentModel = ContentModel(fullName: "", image: "")
    @Namespace private var namespace
    let columns = [
            GridItem(.flexible())
        ]
    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                HeaderView()
                ScrollView(showsIndicators: false) {
                    LazyVStack(spacing: 0) {
                        ForEach($viewModel.content, id: \.identifier) { content in
                            ProfileCardsList(model: content, namespace: namespace)
                                .onTapGesture {
                                    withAnimation(.spring) {
                                        showNavigation.toggle()
                                        selected = content.wrappedValue
                                    }
                                }
                        }
                    }
                }
                .padding(.horizontal, 8)
            }
            .onReceive(NotificationCenter.default.publisher(for: .networkDidChange), perform: { object in
                if let status = object.object as? String, status == "online" {
                    self.getData()
                }
            })
            .onAppear {
                viewModel.getSavedContent()
            }
            
            if showNavigation {
                ProfileDetailView(model: $selected, namespace: namespace, show: $showNavigation)
            }
       }
    }
    
    private func getData() {
        Task {
            await viewModel.fetchAndSetContent()
        }
    }
}
