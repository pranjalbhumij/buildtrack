//
//  buildtrackApp.swift
//  buildtrack
//
//  Created by Baba Yaga on 17/12/24.
//

import SwiftUI

@main
struct buildtrackApp: App {
    let workViewModel: WorkViewModel
    
    init() {
        let context = CoreDataManager.shared(containerName: "", dbPath: URL(string:"")!).context
        let repository = CoreDataWorkRepository(context: context)
        workViewModel = WorkViewModel(repository: repository)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: workViewModel)
        }
    }
}
