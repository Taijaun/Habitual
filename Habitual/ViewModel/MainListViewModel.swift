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
    
    func updateCompletions(newActivity: Activity, oldActivity: Activity){
        //use oldActivity to find where the previous activity was
        let oldIndex = mainList.firstIndex(of: oldActivity)
        
        //replace that index with newActivity
        guard let oldIndex = oldIndex else {return}
        mainList[oldIndex] = newActivity
    }
}
