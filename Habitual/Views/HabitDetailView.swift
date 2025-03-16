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
    
    var body: some View {
        VStack {
            
            Spacer()
            Text(activity.title)
                .font(.title.bold())
                .padding(.bottom)
            
            Text(activity.description)
                .font(.title2)
            
            Spacer()
            
            Button{
                mainListVM.updateCompletions(activity: activity)
                activity.timesCompleted += 1
            }label: {
                HStack{
                    Text("Current completions: \(activity.timesCompleted)")
                    Image(systemName: "plus")
                    
                }
            }
            
        }
        
    }
}

#Preview {
    HabitDetailView(activity: Activity(title: "Read", description: "Read a short story"), mainListVM: MainListViewModel())
}
