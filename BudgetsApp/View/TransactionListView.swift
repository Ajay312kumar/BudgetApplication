//
//  TransactionListView.swift
//  BudgetsApp
//
//  Created by Ajay Kumar on 31/03/25.
//

import SwiftUI
import CoreData

struct TransactionListView: View {
    
    @FetchRequest var transactions: FetchedResults<Transaction>
    let onDeleteTransaction: (Transaction) -> Void
    
    init(request: NSFetchRequest<Transaction>, onDeleteTransaction: @escaping (Transaction) -> Void){
        _transactions = FetchRequest(fetchRequest: request)
        self.onDeleteTransaction = onDeleteTransaction
    }
    
    var body: some View {
        if transactions.isEmpty{
            Text("NO transactions")
        }else{
            List{
                ForEach(transactions){ transaction in
                    HStack{
                        Text(transaction.title ?? "")
                        Spacer()
                        Text(transaction.total as NSNumber, formatter: NumberFormatter.currency)
                    }
                    
                }.onDelete{ offset in
                    offset.map{ transactions[$0]}.forEach(onDeleteTransaction)
                }
            }
        }
    }
}

//#Preview {
//    TransactionListView()
//}
