//
//  ValidationManager.swift
//  swiftuiCombine
//
//  Created by Muhammad Faisal Imran Khan on 2022-02-24.
//

import Foundation

protocol ValidationManager {
    func validate(_ val: Any) -> ValidationError?
}

struct RegexValidationManagerImpl: ValidationManager{
    
    private let items: [RegexFormItem]
    
    init(_ items: [RegexFormItem]){
        self.items = items
    }
    
    func validate(_ val: Any) -> ValidationError? {
        
        let val = (val as? String) ?? ""
        
        for regexItem in items {
            let regex = try? NSRegularExpression(pattern: regexItem.pattern)
            let range = NSRange(location: 0, length: val.count)
            if regex?.firstMatch(in: val, options: [], range: range) == nil{
                return regexItem.error
            }
        }
        
        return nil
    }
}

struct DateValidationManagerImpl: ValidationManager {
    
    private let ageLimit: Int = 10
    
    func validate(_ val: Any) -> ValidationError? {
        
        guard let date = val as? Date else {
            return ValidationError.custom(message: "Invalid Value passed")
            
        }
        
        if let calculatedYr = Calendar.current.dateComponents([.year], from: date, to: Date()).year,
           calculatedYr < ageLimit {
            return ValidationError.custom(message: "User is below the age of 18")
        }
        
        return nil
    }
}
