//
//  MainPageView.swift
//  Time Capsule
//
//  Created by Jay Chiddarwar on 10/30/23.
//

import SwiftUI

struct MainPageView: View {
    @Environment(\.managedObjectContext) private var moc
    @FetchRequest(
        entity: CapsuleEntity.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \CapsuleEntity.unlockDate, ascending: true)],
        predicate: NSPredicate(format: "isLocked == %@", NSNumber(value: true))
    ) var capsules: FetchedResults<CapsuleEntity>
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }.onAppear{
                    unlockCapsulesIfNeeded()
                }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Profile")
                }
            
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
            
        }
    }
    
    func unlockCapsulesIfNeeded() {
        let today = Date()
        var needsSave = false

        for capsule in capsules where capsule.isLocked {
            if let unlockDate = capsule.unlockDate, unlockDate <= today {
                capsule.isLocked = false
                needsSave = true
            }
        }

        if needsSave {
            do {
                try moc.save()
            } catch {
                print("Error saving managed object context: \(error)")
            }
        }
    }
}

struct MainPageView_Previews: PreviewProvider {
    static var previews: some View {
        MainPageView()
    }
}
