//
//  FormItem.swift
//  swiftuiCombine
//
//  Created by Muhammad Faisal Imran Khan on 2022-02-24.
//

import Foundation
import UIKit
import SwiftUI


protocol FormItem {
    var id: UUID { get }
    var formId: FormField { get }
    var validations: [ValidationManager] { get }
    var val: Any? { get }
}

enum FormField {
    case firstName
    case lastName
    case email
    case dob
    case submit
}

class FormComponent: FormItem, Identifiable {
   
    
    let id = UUID()
    let formId: FormField
    let validations: [ValidationManager]
    var val: Any?
    
    init(_ id: FormField, validations: [ValidationManager] = []){
        self.formId = id
        self.validations = validations
    }
}

final class TextFormComponent: FormComponent {
    let placeholder: String
    let keyboardType: UIKeyboardType
    
    init(_ id: FormField, placeholder: String, keyboardType: UIKeyboardType = .default, validations: [ValidationManager] = []) {
        self.placeholder = placeholder
        self.keyboardType = keyboardType
        super.init(id, validations: validations)
    }
}

final class DateFormComponent: FormComponent {
    let mode: DatePickerComponents
    
    init(id: FormField, mode: DatePickerComponents, validations: [ValidationManager] = []){
        self.mode = mode
        super.init(id, validations: validations)
    }
}


final class ButtonFormComponent: FormComponent {
    let title: String
    
    init(id: FormField, title: String) {
        self.title = title
        super.init(id)
    }
}
