//
//  buildtrackApp.swift
//  buildtrack
//
//  Created by Baba Yaga on 17/12/24.
//

import SwiftUI

@main
struct buildtrackApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(works: ModelData().works)
        }
    }
}
