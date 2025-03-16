//
//  AddHabitViewModel.swift
//  Habitual
//
//  Created by Taijaun Pitt on 16/03/2025.
//

import Foundation

final class AddHabitViewModel: ObservableObject {
    
    func createActivity(title: String, description: String) -> Activity {
        let newActivity = Activity(title: title, description: description)
        return newActivity
    }
    
}
