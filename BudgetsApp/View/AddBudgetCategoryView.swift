//
//  AddBudgetCategoryView.swift
//  BudgetApp
//
//  Created by Ajay Kumar on 28/03/25.
//

import SwiftUI

struct AddBudgetCategoryView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var title: String = ""
    @State private var total: Double = 100
    @State private var message: [String] = []
    @Environment(\.dismiss) private var dismiss
    
    var isForm: Bool{
        
        message.removeAll()
        
        if title.isEmpty{
            message.append("Tile is required")
        }
        
        if total <= 0{
            message.append("Toral should be greater than 1")
        }
        
        return message.count == 0
    }
    
    private func save(){
        
        let budget = BudgetCategory(context: viewContext)
        budget.title = title
        budget.total = total
        
        
        //save context
        do{
            try viewContext.save()
        }catch{
            print(error.localizedDescription)
        }
        
        dismiss()
        
    }
    
    
    var body: some View {
        NavigationStack{
            Form{
                TextField("title", text: $title)
                Slider(value: $total, in: 0...500, step: 50){
                    Text("Total")
                } minimumValueLabel: {
                    Text("$0")
                }maximumValueLabel: {
                    Text("$500")
                }
                
                Text(total as NSNumber, formatter: NumberFormatter.currency)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                ForEach(message, id: \.self) { message in
                    Text(message)
                }
                
                
            }.toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    Button("Cancel"){
                        print("Cancel button tapped")
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("Save"){
                        if isForm{
                            save()
                        }
                    }
                }
            }
        }
    }
}

struct AddBudgetCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        AddBudgetCategoryView()
    }
}
