//
//  Transaction+CoreDataClass.swift
//  BudgetsApp
//
//  Created by Ajay Kumar on 30/03/25.
//

import Foundation
import CoreData

public class Transaction: NSManagedObject {

    public override func awakeFromInsert() {
//        super.awakeFromInsert()
        self.dateCreated = Date()
    }
}
