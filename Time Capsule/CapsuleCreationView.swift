//
//  CapsuleCreationView.swift
//  Time Capsule
//
//  Created by Jay Chiddarwar on 10/30/23.
//

import SwiftUI

struct CapsuleCreationView: View {
    @Environment(\.managedObjectContext) var moc
    @State private var title: String = ""
    @State private var descriptionText: String = ""
    @State private var unlockDate: Date = Date()
    @State private var isLocked: Bool = true
    @State private var textContents: [String] = []
    @State private var imageContents: [UIImage] = []
    
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
                        Button("Add Text") {
                            textContents.append("New Text")
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
                    
                    
                    // Creating and setting up the Capsule entity
                    let capsule = CapsuleEntity(context: moc)
                    capsule.id = UUID()
                    capsule.title = self.title
                    capsule.descriptionText = self.descriptionText
                    capsule.isLocked = self.isLocked
                    capsule.unlockDate = self.unlockDate
//                    print(capsule)
                    
                    try? moc.save()


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
