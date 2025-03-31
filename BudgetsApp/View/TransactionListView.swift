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
    
    init(request: NSFetchRequest<Transaction>){
        _transactions = FetchRequest(fetchRequest: request)
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
                    
                }
            }
        }
    }
}

//#Preview {
//    TransactionListView()
//}
