//
//  AvailableCapsuleView.swift
//  Time Capsule
//
//  Created by Jay Chiddarwar on 10/30/23.
//

import SwiftUI

struct AvailableCapsulesView: View {
    var body: some View {
        List {
            // Your available capsules list items go here
            Text("Available Capsule 1")
            Text("Available Capsule 2")
        }
        .navigationTitle("Available Capsules")
    }
}

struct AvailableCapsulesView_Previews: PreviewProvider {
    static var previews: some View {
        AvailableCapsulesView()
    }
}
