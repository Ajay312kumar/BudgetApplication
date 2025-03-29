//
//  NumberFormatter+Extensions.swift
//  BudgetsApp
//
//  Created by Ajay Kumar on 29/03/25.
//

import Foundation

extension NumberFormatter{
    
    static var currency: NumberFormatter{
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }
    
}
