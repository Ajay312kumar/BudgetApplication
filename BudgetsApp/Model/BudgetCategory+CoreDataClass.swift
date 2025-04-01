//
//  BudgetCategory+CoreDataClass.swift
//  BudgetApp
//
//  Created by Ajay Kumar on 27/03/25.
//

import Foundation
import CoreData

@objc(BudgetCategory)
public class BudgetCategory: NSManagedObject {
    
    
    public override func awakeFromNib() {
        self.dateCreated = Date()
    }
    
    var overSpent: Bool {
        remainBudgetTotal < 0
    }
    
    var transactionTotal: Double{
        transactionsArray.reduce(0) { result, transaction in
            result + transaction.total
        }
    }
    
    var remainBudgetTotal: Double{
        self.total - transactionTotal
    }
    
    private var transactionsArray: [Transaction]{
        guard let transaction = transaction else{
            return []
        }
        let allTransaction = (transaction.allObjects as? [Transaction]) ?? []
        return allTransaction.sorted { t1, t2 in
            t1.dateCreated! > t2.dateCreated!
            
        }
    }
    
    static func transactionByCategoryRequest(_ budgetCategory: BudgetCategory) -> NSFetchRequest<Transaction> {
        
        let request = Transaction.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "dateCreated", ascending: false)]
        request.predicate = NSPredicate(format: "category = %@", budgetCategory)
        return request
    }
    
}
