//
//  BudgetSummaryView.swift
//  BudgetsApp
//
//  Created by Ajay Kumar on 02/04/25.
//

import SwiftUI

struct BudgetSummaryView: View {
    
    @ObservedObject var budgetCategory: BudgetCategory
    
    var body: some View {
        HStack{
            Text("\(budgetCategory.overSpent ? "Overspent" : "Remaining") \(Text(budgetCategory.remainBudgetTotal as NSNumber, formatter: NumberFormatter.currency))")
                .frame(maxWidth: .infinity)
                .fontWeight(.bold)
                .foregroundColor(budgetCategory.overSpent ? .red : .green)
        }
    }
}

//#Preview {
//    BudgetSummaryView()
//}
