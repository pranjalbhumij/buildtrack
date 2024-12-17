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
        VStack (alignment: .leading) {
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
    }
    
    var subWorksView: some View {
        List {
            ForEach(work.subWorks!) { work in
                WorkRow(work: work)
            }
        }
    }
}

#Preview {
    WorkDetailView(work: ModelData().works[0])
}
