//
//  HabitDetailView.swift
//  Habitual
//
//  Created by Taijaun Pitt on 16/03/2025.
//


// Make a card view to place text on to look nice

import SwiftUI

struct HabitDetailView: View {
    @State var activity: Activity
    @ObservedObject var mainListVM: MainListViewModel
    @State private var alertSHowing = false
    
    var body: some View {
        VStack {
            
            Spacer()
            
            VStack {
                Text(activity.title)
                    .font(.title.bold())
                    .padding(.vertical)
        
                
                Text(activity.description)
                    .font(.title2)
                
                Text("Completions: \(activity.timesCompleted)")
                    .padding(.top)
            }
            .padding(.bottom, 30)
            .frame(maxWidth: .infinity)
            .background(.thinMaterial)
            .clipShape(.rect(cornerRadius: 20))
            .padding(.horizontal, 20)
            
            Spacer()
            Spacer()
            
            Button{
                alertSHowing.toggle()
            }label: {
                HStack{
                    Text("Completed")
                    Image(systemName: "plus")
                    
                }
                .tint(.white)
            }
            
        }
        .background {
            Image("vegetables")
                .resizable()
                .scaledToFill()
                .blur(radius: 3)
                .overlay(Color.cyan.opacity(0.2))
                .edgesIgnoringSafeArea(.all)
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
