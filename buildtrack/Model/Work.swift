//
//  WorkItem.swift
//  buildtrack
//
//  Created by Pranjal Bhumij on 17/12/24.
//

import Foundation

enum WorkStatus: String, Codable {
    case todo = "To Do"
    case onGoing = "On Going"
    case done = "Done"
}

struct Work: Decodable, Identifiable, Hashable {
    var id = UUID()
    var title: String
    var worker: Worker
    var budget: Int
    var desc: String
    var subWorks: [Work]?
    
    
    
    var status: WorkStatus {
        guard let subWorks = subWorks, !subWorks.isEmpty else {
            return .todo
        }
        if subWorks.contains(where: { $0.status == .onGoing }) {
            return .onGoing
        }
        if subWorks.allSatisfy({ $0.status == .done }) {
            return .done
        }
        return .todo
    }
    
    var progress: Double {
        let subWorks = self.subWorks ?? []
        
        guard !subWorks.isEmpty else {
            return status == .done ? 1.0 : 0.0
        }
        
        let total = Double(subWorks.count)
        let completed = subWorks.map { $0.progress }.reduce(0, +)
        return completed / total
    }
}

