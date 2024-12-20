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

struct Work: Codable, Identifiable, Hashable {
    var id: String
    var title: String
    var worker: Worker?
    var budget: Int32?
    var desc: String?
    var createdOn: Date
    var parentId: String
        
    private enum CodingKeys: String, CodingKey {
        case id, title, createdOn, worker, budget, desc, parentId
    }
    
    init(
            id: String,
            title: String,
            parentId: String,
            worker: Worker?,
            budget: Int32?,
            desc: String?,
            createdOn: Date
        ) {
            self.id = id
            self.title = title
            self.parentId = parentId
            self.worker = worker
            self.budget = budget
            self.desc = desc
            self.createdOn = createdOn
        }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        parentId = try container.decode(String.self, forKey: .parentId)
        worker = try container.decode(Worker.self, forKey: .worker)
        budget = try container.decode(Int32.self, forKey: .budget)
        desc = try container.decode(String.self, forKey: .desc)
        createdOn = try container.decode(Date.self, forKey: .createdOn)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(title, forKey: .title)
        try container.encode(parentId, forKey: .parentId)
        try container.encode(createdOn, forKey: .createdOn)
        try container.encode(worker, forKey: .worker)
        try container.encode(budget, forKey: .budget)
        try container.encode(desc, forKey: .desc)
    }
}

