//
//  RegexPatterns.swift
//  swiftuiCombine
//
//  Created by Muhammad Faisal Imran Khan on 2022-02-24.
//


enum RegexPatterns {
    static let emailChars = ".*[@].*"
    static let higherThanSixChars = "^.{6,}$"
    static let name = "^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$"
}
