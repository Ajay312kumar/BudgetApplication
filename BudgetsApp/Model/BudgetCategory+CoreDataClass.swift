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
    
    static func transactionByCategoryRequest(_ budgetCategory: BudgetCategory) -> NSFetchRequest<Transaction> {
        
        
        let request = Transaction.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "dateCreated", ascending: false)]
        request.predicate = NSPredicate(format: "category = %@", budgetCategory)
        return request
    }
    
}
