//
//  ContentView.swift
//  buildtrack
//
//  Created by Baba Yaga on 17/12/24.
//

import SwiftUI

struct ContentView: View {
    var works: [Work]
    
    var body: some View {
        NavigationStack {
            VStack (alignment: .leading) {
                workList
            }
            .navigationDestination(for: Work.self) { value in
                WorkDetailView(work: value)
            }
        }
    }
    
    var workList: some View {
        List {
            ForEach(works) { work in
                ZStack {
                    NavigationLink(value: work) {
                        EmptyView()
                    }
                    .opacity(0)
                    WorkRow(work: work)
                }
            }
        }
    }
}

#Preview {
    ContentView(works: ModelData().works)
}
