//
//  HomeView.swift
//  Time Capsule
//
//  Created by Jay Chiddarwar on 10/30/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                NavigationLink(destination: CapsuleCreationView()) {
                    Text("Create New Capsule")
                        .font(.title2)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                
                NavigationLink(destination: AvailableCapsulesView()) {
                    HStack {
                        Image(systemName: "lock.open")
                        Text("Available Capsules")
                            .font(.title3)
                    }
                    .padding()
                    .background(Color.green.opacity(0.1))
                    .cornerRadius(8)
                }
                
                NavigationLink(destination: LockedCapsulesView()) {
                    HStack {
                        Image(systemName: "lock")
                        Text("Locked Capsules")
                            .font(.title3)
                    }
                    .padding()
                    .background(Color.red.opacity(0.1))
                    .cornerRadius(8)
                }
                
//                NavigationLink(destination: ImageGridView()) {
//                    HStack {
//                        Image(systemName: "lock")
//                        Text("Image Grid")
//                            .font(.title3)
//                    }
//                    .padding()
//                    .background(Color.red.opacity(0.1))
//                    .cornerRadius(8)
//                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("Home")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
