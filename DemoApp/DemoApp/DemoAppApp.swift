//
//  DemoAppApp.swift
//  DemoApp
//
//  Created by Tejas Todkar on 25/12/24.
//

import SwiftUI

@main
struct DemoAppApp: App {
    let persistenceController = PersistenceController.shared
    @StateObject var viewModel = ContentViewModel(networkManager: NetworkManager())
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewModel)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .onAppear {
                    InternetConnectionManager.shared.startNetworkReachabilityObserver()
                }
        }
        .onChange(of: scenePhase) { newScenePhase in
            switch newScenePhase {
            case .background:
                viewModel.saveContent()
            case .inactive:
                viewModel.saveContent()
            default:
                break
            }
        }
    }
}
