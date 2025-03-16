//
//  MainListViewModel.swift
//  Habitual
//
//  Created by Taijaun Pitt on 16/03/2025.
//

import Foundation

final class MainListViewModel: ObservableObject {
    @Published var mainList: [Activity] = []
    @Published var mockList: [Activity] = Activity.mockData
    
    func addActivity(activity: Activity){
        mainList.append(activity)
    }
}
