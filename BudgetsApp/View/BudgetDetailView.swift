//
//  BudgetDetailView.swift
//  BudgetsApp
//
//  Created by Ajay Kumar on 30/03/25.
//

import SwiftUI

struct BudgetDetailView: View {
    
    let budgetCategory: BudgetCategory
    
    
    var body: some View {
       
        VStack{
            
            VStack(alignment: .leading){
                Text(budgetCategory.title ?? "")
                    .font(.title)
                
                HStack{
                    
                    Text("Budget")
                    Text(budgetCategory.total as NSNumber, formatter: NumberFormatter.currency)
                    
                }.fontWeight(.bold)
            }
            
            Spacer()
        }
    }
}

#Preview {
    BudgetDetailView(budgetCategory: BudgetCategory())
}
