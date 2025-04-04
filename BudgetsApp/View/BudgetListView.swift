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
    let onEditBudgetCategopry: (BudgetCategory) -> Void
    
    var body: some View {
        List {
            
            if !budgetCategoryResults.isEmpty {
                
                ForEach(budgetCategoryResults) { budgetCategory in
                    
                    NavigationLink(value: budgetCategory){
                        HStack {
                            Text(budgetCategory.title ?? "")
                            Spacer()
                            VStack(alignment: .trailing, spacing: 10) {
                                Text(budgetCategory.total as NSNumber, formatter: NumberFormatter.currency)
                                Text("\(budgetCategory.overSpent ? "Overspent" : "Remaining") \(Text(budgetCategory.remainBudgetTotal as NSNumber, formatter: NumberFormatter.currency))")
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                                    .fontWeight(.bold)
                                    .foregroundColor(budgetCategory.overSpent ? .red : .green)
                            }
                        }.contentShape(Rectangle())
                            .onLongPressGesture{
                                onEditBudgetCategopry(budgetCategory)
                            }
                    }
                }.onDelete { indexSet in
                    
                    indexSet.map { self.budgetCategoryResults[$0] }.forEach(self.onDeleteBudgetCategory)
                }
                
            } else {
                Text("No budget categories exists.")
            }
            
        }
        
        .listStyle(.plain)
        .navigationDestination(for: BudgetCategory.self) { budgetCategoryResults in
            BudgetDetailView(budgetCategory: budgetCategoryResults)
        }
    }
}
