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
            Text(activity.title)
            Text(activity.description)
            
            Button{
                let activityCopy = activity
                var newActivity = activity
                newActivity.timesCompleted += 1
                mainListVM.updateCompletions(newActivity: newActivity, oldActivity: activityCopy)
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
