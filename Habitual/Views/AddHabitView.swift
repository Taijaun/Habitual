//
//  AddHabitView.swift
//  Habitual
//
//  Created by Taijaun Pitt on 16/03/2025.
//

import SwiftUI

struct AddHabitView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var mainListVM: MainListViewModel
    
    
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var completions: Int = 0
    
    
    var body: some View {
        NavigationStack {
                Form{
                    Section(header: Text("Add new Habit")
                        .font(.subheadline)
                        .bold()
                        .foregroundColor(.white)
                    ){
                        VStack{
                            TextField("Habit title", text: $title)
                            TextField("Description", text: $description)
                        }
                        
                        Button("Add Activity"){
                            let newActivity = Activity(title: title, description: description)
                            mainListVM.addActivity(activity: newActivity)
                            dismiss()
                        }
                        
                    }
                    
                    
                }
                .scrollContentBackground(.hidden)
                .background(
                    Image("vegetables")
                        .resizable()
                        .scaledToFill()
                        .blur(radius: 3)
                        .overlay(Color.cyan.opacity(0.2))
                        .edgesIgnoringSafeArea(.all)
                )
            
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button("Cancel", role: .cancel){
                            dismiss()
                        }
                        .tint(.white)
                    }
                }
                
        }
        
    }
}

#Preview {
    AddHabitView(mainListVM: MainListViewModel())
}

