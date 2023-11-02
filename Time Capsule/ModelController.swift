//
//  ModelController.swift
//  Time Capsule
//
//  Created by Jay Chiddarwar on 11/1/23.
//

import Foundation
import CoreData

class ModelController: ObservableObject {
    let container = NSPersistentContainer(name: "Time_Capsule")
    
    init () {
        container.loadPersistentStores {
            description, error in if let error = error {
                print("Core data failed to load: \(error.localizedDescription)" )
            }
        }
    }
}
