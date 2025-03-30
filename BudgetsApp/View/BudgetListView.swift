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
    let onDeleteBudgetCategory: (BudgetCategory) -> Void
    
    var body: some View {
        List {
            
            if !budgetCategoryResults.isEmpty {
                
                ForEach(budgetCategoryResults) { budgetCategory in
                   
                    NavigationLink(value: budgetCategory){
                        HStack {
                            Text(budgetCategory.title ?? "")
                            Spacer()
                            VStack {
                                Text(budgetCategory.total as NSNumber, formatter: NumberFormatter.currency)
                            }
                        }
                    }
                }.onDelete { indexSet in
                    
                    indexSet.map { self.budgetCategoryResults[$0] }.forEach(self.onDeleteBudgetCategory)
                }
                
            } else {
                Text("No budget categories exists.")
            }
            
        }.navigationDestination(for: BudgetCategory.self) { budgetCategoryResults in
            BudgetDetailView(budgetCategory: budgetCategoryResults)
        }
    }
}
