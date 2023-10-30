//
//  CapsuleCreationView.swift
//  Time Capsule
//
//  Created by Jay Chiddarwar on 10/30/23.
//

import SwiftUI

struct CapsuleCreationView: View {
    @State private var title: String = ""
    @State private var unlockDate: Date = Date()
    @State private var isLocked: Bool = true
    @State private var textContents: [String] = []
    @State private var imageContents: [UIImage] = [] // Store your images as UIImage
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Capsule Details")) {
                        TextField("Title", text: $title)
                        DatePicker("Unlock Date", selection: $unlockDate, displayedComponents: .date)
                        Toggle("Locked", isOn: $isLocked)
                    }
                    
                    Section(header: Text("Add Text Content")) {
                        ForEach(textContents.indices, id: \.self) { index in
                            Text(textContents[index])
                        }
                        Button("Add Text") {
                            textContents.append("New Text") // Here, you can input or append text content
                        }
                    }
                    
                    Section(header: Text("Add Image Content")) {
                        ForEach(imageContents.indices, id: \.self) { index in
                            Image(uiImage: imageContents[index])
                                .resizable()
                                .scaledToFit()
                        }
                        Button("Add Image") {
                            // Here, you can input or append new images to the imageContents array
                        }
                    }
                }
                .navigationBarTitle("Create Capsule")
                .navigationBarItems(trailing: Button("Save") {
                    // Your save action here
                })
            }
        }
    }
}

struct CapsuleCreationView_Previews: PreviewProvider {
    static var previews: some View {
        CapsuleCreationView()
    }
}
