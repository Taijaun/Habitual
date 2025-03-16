//
//  Activity.swift
//  Habitual
//
//  Created by Taijaun Pitt on 16/03/2025.
//

import Foundation

struct Activity: Identifiable, Codable {
    
    var id = UUID()
    let title: String
    let description: String
    var timesCompleted: Int
}


final class ActivityList: ObservableObject {
    @Published var listOfActivities: [Activity]
    
    init(listOfActivities: [Activity]) {
        self.listOfActivities = []
    }
}
