//
//  RandomNameGenerator.swift
//  TestWork
//
//  Created by Ильнур Закиров on 04.10.2023.
//

import Foundation

class RandomNameGenerator {
    
    static let shared = RandomNameGenerator()
    
    private init() {}
    
    func randomHexString() -> String {
        var data = Data(count: 20)
        _ = data.withUnsafeMutableBytes { mutableBytes in
            SecRandomCopyBytes(kSecRandomDefault, 20, mutableBytes.baseAddress!)
        }
        return data.map { String(format: "%02hhx", $0) }.joined()
    }
}
