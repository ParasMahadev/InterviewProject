//
//  ProductErrors.swift
//  TestProject
//
//  Created by Paras Navadiya on 10/22/24.
//

import Foundation

enum CartErrors: Error {
    
    case invalidURL
    case noData
    case decodingFailed
    case networkError(Error)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "The URL provided was invalid."
        case .noData:
            return "No data was received from the server."
        case .decodingFailed:
            return "Failed to decode the data from the server."
        case .networkError(let error):
            return error.localizedDescription
        }
    }
}
