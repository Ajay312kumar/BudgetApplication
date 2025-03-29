//
//  BudgetListView.swift
//  BudgetsApp
//
//  Created by Ajay Kumar on 29/03/25.
//

import SwiftUI

import SwiftUI

struct BudgetListView: View {
    
    let budgetCategoryResults: FetchedResults<BudgetCategory>
    
    var body: some View {
        List {
            
            if !budgetCategoryResults.isEmpty {
                
                ForEach(budgetCategoryResults) { budgetCategory in
                    HStack {
                        Text(budgetCategory.title ?? "")
                        Spacer()
                        VStack {
                            Text(budgetCategory.total as NSNumber, formatter: NumberFormatter.currency)
                        }
                    }
                }
                
            } else {
                Text("No budget categories exists.")
            }
            
        }
    }
}
