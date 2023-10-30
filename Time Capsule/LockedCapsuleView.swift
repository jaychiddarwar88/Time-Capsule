//
//  LockedCapsuleView.swift
//  Time Capsule
//
//  Created by Jay Chiddarwar on 10/30/23.
//

import SwiftUI

struct LockedCapsulesView: View {
    var body: some View {
        List {
            // Your locked capsules list items go here
            Text("Locked Capsule 1")
            Text("Locked Capsule 2")
        }
        .navigationTitle("Locked Capsules")
    }
}

struct LockedCapsulesView_Previews: PreviewProvider {
    static var previews: some View {
        LockedCapsulesView()
    }
}
