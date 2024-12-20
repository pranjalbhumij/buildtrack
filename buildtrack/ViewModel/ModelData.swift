//
//  ModelData.swift
//  buildtrack
//
//  Created by Baba Yaga on 17/12/24.
//

import Foundation

@Observable
class ModelData {
    var works: [Work] = load("work_data.json")
}

func load<T: Decodable>(_ fileName: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: fileName, withExtension: nil) else {
        fatalError("Couldn't find \(fileName) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(fileName) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(fileName) as \(T.self):\n\(error)")
    }
}

func save<T: Encodable>(data: T, fileName: String) {
    do {
        let encodedData = try JSONEncoder().encode(data)
        guard let file = Bundle.main.url(forResource: fileName, withExtension: nil) else {
            fatalError("Couldn't find \(fileName) in main bundle.")
        }
        try encodedData.write(to: file)
    } catch {
        fatalError("Couldn't encode \(fileName) as \(T.self):\n\(error)")
    }
}
