//
//  WorkViewModel.swift
//  buildtrack
//
//  Created by Pranjal Bhumij on 17/12/24.
//

import Foundation

class WorkViewModel: ObservableObject {
    @Published var works: [Work]
    
    init() {
        works = ModelData().works
    }
    
    
}
