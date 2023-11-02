//
//  Time_CapsuleApp.swift
//  Time Capsule
//
//  Created by Jay Chiddarwar on 10/28/23.
//

import SwiftUI

@main
struct Time_CapsuleApp: App {
    
    @StateObject private var dataController = ModelController()
    
    var body: some Scene {
        WindowGroup {
            MainPageView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
