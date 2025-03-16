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


//final class ActivityList: ObservableObject {
//    @Published var listOfActivities: [Activity]
//    
//    init(listOfActivities: [Activity]) {
//        self.listOfActivities = []
//    }
//}

extension Activity {
    static let mockData: [Activity] = [
        Activity(title: "Exercise", description: "Hit the gym", timesCompleted: 5),
        Activity(title: "Read", description: "Read 10 page sof a book", timesCompleted: 2),
        Activity(title: "Code", description: "Build your app", timesCompleted: 1)
    ]
}
