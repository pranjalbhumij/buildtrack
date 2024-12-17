//
//  WorkRow.swift
//  buildtrack
//
//  Created by Baba Yaga on 17/12/24.
//

import SwiftUI

struct WorkRow: View {
    var work: Work
    
    var completedWorks: Int {
            return work.subWorks?.filter { $0.status == .done }.count ?? 0
        }
        
        var totalWorks: Int {
            return work.subWorks?.count ?? 0
        }
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text(work.title).font(.headline)
            }
            Text("status: "+work.status.rawValue).font(.subheadline)
            ProgressView(value: work.progress)
                .progressViewStyle(LinearProgressViewStyle())
            if totalWorks > 0 {
                Text("\(completedWorks)/\(totalWorks) completed").font(.subheadline)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}

#Preview {
    WorkRow(work: ModelData().works[0])
}
