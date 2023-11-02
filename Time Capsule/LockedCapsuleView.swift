//
//  LockedCapsuleView.swift
//  Time Capsule
//
//  Created by Jay Chiddarwar on 10/30/23.
//

import SwiftUI

struct LockedCapsulesView: View {
    @FetchRequest(
        entity: CapsuleEntity.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \CapsuleEntity.unlockDate, ascending: true)],
        predicate: NSPredicate(format: "isLocked == %@", NSNumber(value: true))
    ) var capsules: FetchedResults<CapsuleEntity>
        
    var body: some View {
        NavigationView{
            List(capsules) { capsule in
                Text(capsule.title ?? "Unnamed Capsule")
            }
            .navigationTitle("Locked Capsules")
        }
    }
}

struct LockedCapsulesView_Previews: PreviewProvider {
    static var previews: some View {
        LockedCapsulesView()
    }
}
