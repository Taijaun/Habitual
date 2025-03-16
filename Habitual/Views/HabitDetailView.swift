//
//  HabitDetailView.swift
//  Habitual
//
//  Created by Taijaun Pitt on 16/03/2025.
//

import SwiftUI

struct HabitDetailView: View {
    @State var activity: Activity
    @ObservedObject var mainListVM: MainListViewModel
    @State private var alertSHowing = false
    
    var body: some View {
        VStack {
            
            Spacer()
            Text(activity.title)
                .font(.title.bold())
                .padding(.bottom)
            
            Text(activity.description)
                .font(.title2)
            
            Text("Completions: \(activity.timesCompleted)")
                .padding(.top)
            
            Spacer()
            
            Button{
                alertSHowing.toggle()
            }label: {
                HStack{
                    Text("Completed")
                    Image(systemName: "plus")
                    
                }
            }
            
        }
        .alert("Are you sure?", isPresented: $alertSHowing) {
            Button("Confirm") {
                mainListVM.updateCompletions(activity: activity)
                activity.timesCompleted += 1
                alertSHowing.toggle()
            }
            Button("Cancel", role: .cancel){
                alertSHowing.toggle()
            }
        } message: {
            Text("Are you sure you want to increment this? You will not be able to reduce it.")
        }
        
    }
}

#Preview {
    HabitDetailView(activity: Activity(title: "Read", description: "Read a short story"), mainListVM: MainListViewModel())
}
