//
//  NoteRepository.swift
//  buildtrack
//
//  Created by Pranjal Bhumij on 18/12/24.
//

import Foundation
import Combine

protocol WorkRepository {
    func fetch(parentId: String) -> AnyPublisher<[Work], Error>
    func add(_ work: Work) -> AnyPublisher<Void, Error>
    func update(_ work: Work) -> AnyPublisher<Void, Error>
    func delete(id: String) -> AnyPublisher<Void, Error>
}
