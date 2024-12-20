//
//  ContentView.swift
//  buildtrack
//
//  Created by Baba Yaga on 17/12/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: WorkViewModel
    @State var addNewWork: Bool = false
    
    public init(viewModel: WorkViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var sortedWorks: [Work] {
        sortWorksByCreation(works: viewModel.works)
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
               workContent
               floatingButton
            }
        }
    }
    
    var workContent: some View {
        VStack (alignment: .leading) {
            workList
        }
        .navigationDestination(for: Work.self) { value in
            let context = CoreDataManager.shared(containerName: "", dbPath: URL(string:"")!).context
            let repository = CoreDataWorkRepository(context: context)
            WorkDetailView(viewModel: SubWorkViewModel(repository: repository, parentId: ""), work: value)
        }
        .onAppear {
            viewModel.getWorks()
        }
    }
    
    var floatingButton: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button(action: {addNewWork = true}) {
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.buttonBackground)
                        .clipShape(Circle())
                        .shadow(radius: 5)
                }
                .padding()
            }
        }
        .sheet(isPresented: $addNewWork, content: {
            AddWorkView(isPresented: $addNewWork, viewModel: viewModel)
                .presentationDetents([.medium, .medium])
                .presentationDragIndicator(.hidden)
                .interactiveDismissDisabled(false)
        })
    }
    
    var workList: some View {
        List {
            ForEach(sortedWorks) { work in
                ZStack {
                    NavigationLink(value: work) {
                        EmptyView()
                    }
                    .opacity(0)
                    WorkRow(work: work)
                        .contentShape(Rectangle())
                }
            }
            .listRowBackground(Color.white)
            .listRowSeparator(.hidden)
        }
        .listStyle(.automatic)
    }

    
    private func sortWorksByCreation(works: [Work]) -> [Work] {
        return works.sorted { a, b in
            a.createdOn > b.createdOn
        }
    }
}

//#Preview {
//    ContentView(viewModel: WorkViewModel())
//}
