//
//  ContentView.swift
//  BudgetsApp
//
//  Created by Ajay Kumar on 29/03/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var isPresented: Bool = false
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: []) private var budgetCategoryResults: FetchedResults<BudgetCategory>
    
    var body: some View {
        
        NavigationStack{
        VStack {
            List(budgetCategoryResults){ budgetCategory in
                Text(budgetCategory.title ?? "No Name")
                
            }
        }
            
        .sheet(isPresented: $isPresented, content:{
            AddBudgetCategoryView()
        })
            
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing){
                Button("Add Category"){
                    isPresented = true
                }
            }
        }
        .padding()
            
        
    }
}
}

#Preview {
    ContentView()
}
