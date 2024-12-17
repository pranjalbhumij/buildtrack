//
//  WorkDetailView.swift
//  buildtrack
//
//  Created by Pranjal Bhumij on 17/12/24.
//

import SwiftUI

struct WorkDetailView: View {
    var work: Work
    
    var body: some View {
        VStack {
            mainWorkView
            subWorksView
        }
    }
    
    var mainWorkView: some View {
        VStack (alignment: .leading) {
            Text(work.title)
            Text(work.status.rawValue)
            Text(work.desc)
            ProgressView(value: work.progress)
                .progressViewStyle(LinearProgressViewStyle())
        }
        .padding()
    }
    
    var subWorksView: some View {
        Group {
            if let subWorks = work.subWorks, !subWorks.isEmpty {
                List {
                    ForEach(subWorks) { subWork in
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

#Preview {
    WorkDetailView(work: ModelData().works[0])
}
