//
//  WorkDetailView.swift
//  buildtrack
//
//  Created by Pranjal Bhumij on 17/12/24.
//

import SwiftUI

struct WorkDetailView: View {
    @ObservedObject var viewModel: SubWorkViewModel
    var work: Work
    
    var body: some View {
        VStack (alignment: .leading) {
            mainWorkView
            subWorksView
        }
    }
    
    var mainWorkView: some View {
        VStack (alignment: .leading) {
            Text(work.title).font(.headline)
            Text((work.desc ?? "").isEmpty ? "" : work.desc!).font(.subheadline)
        }
        .padding()
    }
    
    var subWorksView: some View {
        Group {
            if !viewModel.works.isEmpty {
                List {
                    ForEach(viewModel.works) { subWork in
                        ZStack {
                            NavigationLink(value: subWork) {
                                EmptyView()
                            }
                            .opacity(0)
                            WorkRow(work: subWork)
                        }
                    }
                }
            } else {
                Text("No sub-works available")
                    .foregroundColor(.gray)
                    .italic()
            }
        }
    }


}

//#Preview {
//    WorkDetailView(work: ModelData().works[0])
//}
