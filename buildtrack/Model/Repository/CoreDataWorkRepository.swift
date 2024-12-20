//
//  CoreDataWorkRepository.swift
//  buildtrack
//
//  Created by Pranjal Bhumij on 18/12/24.
//

import Foundation
import Combine
import CoreData

class CoreDataWorkRepository: WorkRepository {
    private let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func fetch(parentId: String) -> AnyPublisher<[Work], any Error> {
        Future { [weak self] promise in
            let request: NSFetchRequest<WorkEntity> = WorkEntity.fetchRequest()
            request.predicate = NSPredicate(format: "parentId == %@", parentId)
            promise(Result {
                let results = try self!.context.fetch(request)
                return results.map { $0.toWork() }
            })
        }.eraseToAnyPublisher()
    }
    
    func add(_ work: Work) -> AnyPublisher<Void, any Error> {
        Future { [weak self] promise in
            promise(Result {
                let workEntity = WorkEntity(context: self!.context)
                workEntity.update(with: work, context: self!.context)
                try self!.saveContext()
            })
        }.eraseToAnyPublisher()
    }
    
    func update(_ work: Work) -> AnyPublisher<Void, any Error> {
        Future { [weak self] promise in
            let fetchRequest: NSFetchRequest = WorkEntity.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "id == %@", work.id)
            promise(Result {
                if let workEntity = try self!.context.fetch(fetchRequest).first {
                    workEntity.update(with: work, context: self!.context)
                    try self!.saveContext()
                }
            })
        }.eraseToAnyPublisher()
    }
    
    func delete(id: String) -> AnyPublisher<Void, any Error> {
        Future { [weak self] promise in
            let fetchRequest: NSFetchRequest = WorkEntity.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "id == %@", id)
            promise(Result {
                if let workEntity = try self!.context.fetch(fetchRequest).first {
                    self!.context.delete(workEntity)
                    try self!.saveContext()
                }
            })
        }.eraseToAnyPublisher()
    }
    
    private func saveContext() throws {
        if context.hasChanges {
            try context.save()
        }
    }
}
