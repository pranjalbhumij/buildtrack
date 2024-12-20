//
//  WorkViewModel.swift
//  buildtrack
//
//  Created by Pranjal Bhumij on 17/12/24.
//

import Foundation
import Combine

class WorkViewModel: ObservableObject {
    var repository: WorkRepository
    @Published var works: [Work] = []
    var cancellable = Set<AnyCancellable>()
    
    init(repository: WorkRepository) {
        self.repository = repository
    }
    
    func getWorks() {
        works.removeAll()
        repository.fetch(parentId: "")
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                if case .failure(_) = completion {
                    self?.works.removeAll()
                }
            }, receiveValue: { [weak self] value in
                self?.works.removeAll()
                self?.works = value
            })
            .store(in: &cancellable)
    }
    
    func addWork(_ work: Work) {
        repository.add(work)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                if case .finished = completion {
                    self?.works.append(work)
                }
            }, receiveValue: { _ in  })
            .store(in: &cancellable)
    }
    
}

class SubWorkViewModel: ObservableObject {
    var repository: WorkRepository
    var parentId: String
    @Published var works: [Work] = []
    var cancellable = Set<AnyCancellable>()
    
    init(repository: WorkRepository, parentId: String) {
        self.repository = repository
        self.parentId = parentId
        getWorks()
    }
    
    func getWorks() {
        works.removeAll()
        repository.fetch(parentId: parentId)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                if case .failure(_) = completion {
                    self?.works.removeAll()
                }
            }, receiveValue: { [weak self] value in
                self?.works.removeAll()
                self?.works = value
            })
            .store(in: &cancellable)
    }
    
    func addWork(_ work: Work) {
        repository.add(work)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                if case .finished = completion {
                    self?.works.append(work)
                }
            }, receiveValue: { _ in  })
            .store(in: &cancellable)
    }
}
