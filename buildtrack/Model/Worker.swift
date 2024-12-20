//
//  Worker.swift
//  buildtrack
//
//  Created by Pranjal Bhumij on 17/12/24.
//

import Foundation

struct Worker: Codable, Hashable {
    var contactNumber: Int32
    var totalPayment: Int32
    var paid: Int32
    var balance: Int32
}
