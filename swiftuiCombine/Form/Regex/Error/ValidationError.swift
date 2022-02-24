//
//  ValidationError.swift
//  swiftuiCombine
//
//  Created by Muhammad Faisal Imran Khan on 2022-02-24.
//

import Foundation

enum ValidationError: Error {
    case custom(message: String)
}

extension ValidationError{
    
    var errorDescription: String {
        
        switch self {
        case .custom(let message):
            return message
        }
    }
}
