//
//  WorkerEntity+CoreDataProperties.swift
//  buildtrack
//
//  Created by Baba Yaga on 18/12/24.
//
//

import Foundation
import CoreData


extension WorkerEntity {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<WorkerEntity> {
        return NSFetchRequest<WorkerEntity>(entityName: "WorkerEntity")
    }
    
    @NSManaged public var contactNumber: Int32
    @NSManaged public var totalPayment: Int32
    @NSManaged public var paid: Int32
    @NSManaged public var balance: Int32
    
    func toWorker() -> Worker {
        return Worker(contactNumber: self.contactNumber,
                      totalPayment: self.totalPayment,
                      paid: self.paid,
                      balance: self.balance)
    }
    
    func update(with worker: Worker) -> WorkerEntity {
        self.contactNumber = worker.contactNumber
        self.totalPayment = worker.totalPayment
        self.paid = worker.paid
        self.balance = worker.balance
        return self
    }
}

extension WorkerEntity : Identifiable {
    
}
