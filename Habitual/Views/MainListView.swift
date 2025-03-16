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
            ZStack {
                List {
                    Section(header: Text("My Habits")
                        .font(.subheadline)
                        .bold()
                        .foregroundStyle(Color.white)
                            
                    ) {
                        ForEach(viewModel.mainList) { activity in
                            NavigationLink {
                                HabitDetailView(activity: activity, mainListVM: viewModel)
                            }label:{
                                VStack(alignment: .leading) {
                                    Text(activity.title)
                                        .font(.headline)
                                        .padding(.top, 10)
                                    Text(activity.description)
                                        .font(.subheadline)
                                        .padding(.bottom, 10)
                                }
                            }
                            .listRowBackground(
                                Capsule()
                                    .fill(Color(white: 1, opacity: 0.8))
                                    .padding(.vertical, 2)
                                    .padding(.horizontal, 5)
                            )
                        }
                        .onDelete(perform: viewModel.removeHabit)
                        .listRowInsets(.init(top: 0, leading: 30, bottom: 0, trailing: 30))
                    }
                    
                    
                }
                .scrollContentBackground(.hidden)
                .background {
                    Image("vegetables")
                        .resizable()
                        .scaledToFill()
                        .blur(radius: 3)
                        .overlay(Color.cyan.opacity(0.2))
                        .edgesIgnoringSafeArea(.all)
                }
                // Present the add habit view as a sheet
                .sheet(isPresented: $showAddView, content: {
                    AddHabitView(mainListVM: viewModel)
                })
                .toolbar{
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            showAddView.toggle()
                        }label: {
                            Image(systemName: "plus")
                        }
                        .tint(.white)
                    }
                }
            }
            
        }
            
        
    }
}

#Preview {
    MainListView()
}
