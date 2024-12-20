//
//  WorkEntity+CoreDataProperties.swift
//  buildtrack
//
//  Created by Baba Yaga on 18/12/24.
//
//

import Foundation
import CoreData


extension WorkEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WorkEntity> {
        return NSFetchRequest<WorkEntity>(entityName: "WorkEntity")
    }

    @NSManaged public var title: String
    @NSManaged public var desc: String?
    @NSManaged public var budget: Int32
    @NSManaged public var id: String
    @NSManaged public var parentId: String
    @NSManaged public var createdOn: Date
    @NSManaged public var worker: WorkerEntity?
    
    func toWork() -> Work {
        return Work(id: self.id,
                    title: self.title,
                    parentId: self.parentId,
                    worker: self.worker?.toWorker(),
                    budget: self.budget,
                    desc: self.desc,
                    createdOn: self.createdOn)
    }
    
    func update(with work: Work, context: NSManagedObjectContext) {
        self.id = work.id
        self.title = work.title
        if let budget = work.budget {
            self.budget = work.budget!
        }
        self.createdOn = work.createdOn
        self.desc = work.desc
        if let worker = work.worker {
            self.worker = WorkerEntity(context: context).update(with: work.worker!)
        }
        self.parentId = work.parentId
    }
}

extension WorkEntity : Identifiable {

}
