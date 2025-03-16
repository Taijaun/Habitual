//
//  ContentView.swift
//  Habitual
//
//  Created by Taijaun Pitt on 16/03/2025.
//

import SwiftUI

struct MainListView: View {
    @StateObject private var viewModel = MainListViewModel()
    
    var body: some View {
        NavigationStack {
            List(Activity.mockData) { activity in
                VStack(alignment: .leading) {
                    Text(activity.title)
                    Text(activity.description)
                }
                
            }
            .navigationTitle("My Habits")
        }
    }
}

#Preview {
    MainListView()
}
