//
//  AddWorkView.swift
//  buildtrack
//
//  Created by Baba Yaga on 18/12/24.
//

import SwiftUI

struct AddWorkView: View {
    @Binding var isPresented: Bool
    @ObservedObject var viewModel: WorkViewModel
    @State private var taskName: String = ""
    @State private var description: String = ""

    var body: some View {
        VStack(alignment: .leading) {
            TextField("Work Name", text: $taskName)
                .font(.title2)
                .padding(.horizontal)
                .padding(.vertical, 8)
                .cornerRadius(8)

            TextField("Description", text: $description)
                .padding(.horizontal)
                .padding(.vertical, 8)
                .cornerRadius(8)

            HStack {
                Button(action: {
//                    let newWork = Work(title: taskName, worker: nil, budget: nil, desc: description)
//                    viewModel.addWork(newWork)
                    isPresented = false
                }) {
                    Text("Add Work")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.buttonBackground)
                        .cornerRadius(8)
                }
            }
            Spacer()
        }
        .padding()
    }
}

//#Preview {
//    ContentView(viewModel: WorkViewModel())
//}
