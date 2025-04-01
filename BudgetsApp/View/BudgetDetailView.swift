//
//  BudgetDetailView.swift
//  BudgetsApp
//
//  Created by Ajay Kumar on 30/03/25.
//

import SwiftUI
import CoreData

struct BudgetDetailView: View {
    
    let budgetCategory: BudgetCategory
    @State  private var title: String = ""
    @State  private var total: String = ""
    
    @Environment(\.managedObjectContext) var viewContext
    
    var isFormValid: Bool{
        guard let totalAsDouble = Double(total) else {
            return false
        }
        return !title.isEmpty && !total.isEmpty && totalAsDouble > 0
        
    }
    
    private func saveTransaction(){
        do{
            let transaction = Transaction(context: viewContext)
            transaction.title = title
            transaction.total = Double(total)!
            budgetCategory.addToTransaction(transaction)
            try viewContext.save()
        }catch{
            print(error.localizedDescription)
        }
    }
    
    var body: some View {
       
        VStack(alignment: .leading){
            HStack{
                
                VStack(alignment: .center){
                    Text(budgetCategory.title ?? "")
                        .font(.title)
                    
                    HStack{
                        
                        Text("Budget")
                        Text(budgetCategory.total as NSNumber, formatter: NumberFormatter.currency)
                        
                    }.fontWeight(.bold)
                }
            }

            Form{
                
                Section{
                    TextField("Title", text: $title)
                    TextField("Total", text: $total)
                }header: {
                    Text("Add Transaction")
                }
                
                HStack{
                    Spacer()
                    Button("Save Transaction"){
                        saveTransaction()
                    }.disabled(!isFormValid)
                    Spacer()
                }
            }
            
            //Display summary of the budget category
            BudgetSummaryView(budgetCategory: budgetCategory)
            
            
            //Display the transaction
            TransactionListView(request: BudgetCategory.transactionByCategoryRequest(budgetCategory))
            
            Spacer()
        }.padding()
    }
}

#Preview {
    BudgetDetailView(budgetCategory: BudgetCategory())
}
