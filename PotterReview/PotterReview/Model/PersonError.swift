//
//  PersonError.swift
//  PotterReview
//
//  Created by adetokunbo babatunde on 6/23/20.
//  Copyright © 2020 adetokunbo babatunde. All rights reserved.
//

import Foundation

enum PersonError: LocalizedError {
    case invalidURL
    case thrownError(Error)
    case noData
    
    var errorDescription: String? {
        switch self {
            
        case .invalidURL:
            return "bad url"
        case .thrownError(let error):
            return "Thrown \(error)"
        case .noData:
            return "no data"
        }
    }
    
}
