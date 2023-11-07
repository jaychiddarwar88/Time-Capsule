//
//  AvailableCapsuleView.swift
//  Time Capsule
//
//  Created by Jay Chiddarwar on 10/30/23.
//

import SwiftUI

struct AvailableCapsulesView: View {
    
    @FetchRequest(
        entity: CapsuleEntity.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \CapsuleEntity.unlockDate, ascending: true)],
        predicate: NSPredicate(format: "isLocked == %@", NSNumber(value: false))
    ) var capsules: FetchedResults<CapsuleEntity>
        
    var body: some View {
        NavigationView {
            List(capsules, id: \.self) { capsule in
                NavigationLink(destination: ImageGridView(capsuleID: capsule.objectID)) {
                    Text(capsule.title ?? "Unnamed Capsule")
                }
            }
            .navigationTitle("Available Capsules")
        }
    }
        
        // This function prints the details of a capsule.
    func printCapsuleDetails(_ capsule: CapsuleEntity) {
        if let name = capsule.title {
            print("Capsule Name: \(name)")
        } else {
            print("Capsule Name: Unnamed Capsule")
        }
    }
}

struct AvailableCapsulesView_Previews: PreviewProvider {
    static var previews: some View {
        AvailableCapsulesView()
    }
}
