//
//  WorkRow.swift
//  buildtrack
//
//  Created by Baba Yaga on 17/12/24.
//

import SwiftUI

struct WorkRow: View {
    var work: Work
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text(work.title).font(.headline)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}

#Preview {
    WorkRow(work: ModelData().works[0])
}
