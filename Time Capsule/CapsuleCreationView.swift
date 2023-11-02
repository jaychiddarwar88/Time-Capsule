//
//  CapsuleCreationView.swift
//  Time Capsule
//
//  Created by Jay Chiddarwar on 10/30/23.
//

import SwiftUI
import UIKit

struct CapsuleCreationView: View {
    @Environment(\.managedObjectContext) var moc
    @State private var title: String = ""
    @State private var descriptionText: String = ""
    @State private var unlockDate: Date = Date()
    @State private var isLocked: Bool = true
    @State private var textContents: [String] = []
    @State private var imageContents: [UIImage] = []
    @State private var shouldNavigate = false
    @State private var newTextContent: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Capsule Details")) {
                        TextField("Title", text: $title)
                        TextField("Capsule Description", text: $descriptionText)
                        DatePicker("Unlock Date", selection: $unlockDate, displayedComponents: .date)
                        Toggle("Locked", isOn: $isLocked)
                    }
                    
                    Section(header: Text("Add Text Content")) {
                        ForEach(textContents.indices, id: \.self) { index in
                            Text(textContents[index])
                        }
                        // Add a text field for user to enter new text
                        TextField("Enter text", text: $newTextContent)
                            .textFieldStyle(RoundedBorderTextFieldStyle())

                        Button("Add Text") {
                            // Append the new text to the textContents array
                            if !newTextContent.isEmpty {
                                textContents.append(newTextContent)
                                newTextContent = ""
                            }
                        }
                    }
                    
                    Section(header: Text("Add Image Content")) {
                        ForEach(imageContents.indices, id: \.self) { index in
                            Image(uiImage: imageContents[index])
                                .resizable()
                                .scaledToFit()
                        }
                        Button("Add Image") {
                            
                        }
                    }
                }
                .navigationBarTitle("Create Capsule")
                .navigationBarItems(trailing: Button("Save") {
                    
                    let capsule = CapsuleEntity(context: moc)
                    
                    capsule.id = UUID()
                    capsule.title = self.title
                    capsule.descriptionText = self.descriptionText
                    capsule.isLocked = self.isLocked
                    capsule.unlockDate = self.unlockDate
                    
                    for text in textContents {
                        let content = ContentEntity(context: moc)
                        content.contentId = UUID()
                        content.type = "TEXT"
                        content.textContent = text
                        content.imageContent = nil
                        capsule.addToContent(content)
                    }
                    
                    // For each image content, create a new Content entity
                    for image in imageContents {
                        let content = ContentEntity(context: moc)
                        content.contentId = UUID()
                        content.type = "IMAGE"
                        content.textContent = nil
                        if let imageData = image.jpegData(compressionQuality: 1.0) {
                            content.imageContent = imageData
                        }
                        capsule.addToContent(content)
                    }
                    
                    try? moc.save()
                    shouldNavigate = true
                    
                    //Logic to navigate back to home view.
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
