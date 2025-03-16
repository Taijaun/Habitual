//
//  ContentView.swift
//  Habitual
//
//  Created by Taijaun Pitt on 16/03/2025.
//

import SwiftUI

struct MainListView: View {
    @StateObject private var viewModel = MainListViewModel()
    
    @State private var showAddView = false
    
    var body: some View {
        NavigationStack {
            List(Activity.mockData) { activity in
                VStack(alignment: .leading) {
                    Text(activity.title)
                        .font(.headline)
                    Text(activity.description)
                        .font(.subheadline)
                }
                
            }
            .navigationTitle("My Habits")
            // Present the add habit view as a sheet
            .sheet(isPresented: $showAddView, content: {
                AddHabitView()
            })
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showAddView.toggle()
                    }label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

#Preview {
    MainListView()
}
