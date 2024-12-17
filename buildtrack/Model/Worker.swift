//
//  Worker.swift
//  buildtrack
//
//  Created by Pranjal Bhumij on 17/12/24.
//

import Foundation

struct Worker: Decodable, Hashable {
    var contactNumber: Int
    var totalPayment: Int
    var paid: Int
    var balance: Int
}
