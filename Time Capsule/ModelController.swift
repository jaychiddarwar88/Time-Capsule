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
    static var preview: ModelController = {
            let result = ModelController(inMemory: true)
            let viewContext = result.container.viewContext
            // Create some mock entities here to populate your preview
            return result
        }()
    
//    init () {
//        container.loadPersistentStores {
//            description, error in if let error = error {
//                print("Core data failed to load: \(error.localizedDescription)" )
//            }
//        }
//    }
    
    init(inMemory: Bool = false) {
            if inMemory {
                container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
            }
            container.loadPersistentStores(completionHandler: { (storeDescription, error) in
                if let error = error as NSError? {
                    fatalError("Unresolved error \(error), \(error.userInfo)")
                }
            })
        }
}
