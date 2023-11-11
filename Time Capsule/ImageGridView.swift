//
//  ImageGridView.swift
//  Time Capsule
//
//  Created by Jay Chiddarwar on 11/4/23.
//

import SwiftUI
import PhotosUI
import CoreData

struct ImageGridView: View {
    // Task: to show all kind of content like text or image
    
    var textFetchRequest: FetchRequest<ContentEntity>
        var imageFetchRequest: FetchRequest<ContentEntity>

        var textContents: FetchedResults<ContentEntity> { textFetchRequest.wrappedValue }
        var imageContents: FetchedResults<ContentEntity> { imageFetchRequest.wrappedValue }

        let columns = [GridItem(.adaptive(minimum: 100))]

        init(capsuleID: NSManagedObjectID) {
            // Fetch Requests
            textFetchRequest = FetchRequest<ContentEntity>(
                entity: ContentEntity.entity(),
                sortDescriptors: [],
                predicate: NSPredicate(format: "type == %@ AND capsule == %@", "TEXT", capsuleID)
            )
            imageFetchRequest = FetchRequest<ContentEntity>(
                entity: ContentEntity.entity(),
                sortDescriptors: [],
                predicate: NSPredicate(format: "type == %@ AND capsule == %@", "IMAGE", capsuleID)
            )
        }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    // Text Section
                    Section(header: Text("Text Content").font(.headline)) {
                        ForEach(textContents, id: \.self) { content in
                            Text(content.textContent ?? "")
                                .padding()
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(8)
                        }
                    }

                    // Image Section
                    Section(header: Text("Image Content").font(.headline)) {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(imageContents, id: \.self) { content in
                                if let imageData = content.imageContent, let uiImage = UIImage(data: imageData) {
                                    Image(uiImage: uiImage)
                                        .resizable()
                                        .scaledToFit()
                                }
                            }
                        }
                    }
                }
            }
            .padding()
        }
    }
}

struct ImageGridView_Previews: PreviewProvider {
    static var previews: some View {
        
        let context = ModelController.preview.container.viewContext
                
        // Create a mock capsule to pass to the ImageGridView
        let newCapsule = CapsuleEntity(context: context)
        newCapsule.title = "Preview Capsule"
        newCapsule.isLocked = false
        newCapsule.unlockDate = Date()
        
        // Save the context to ensure the newCapsule is properly inserted
        try? context.save()
        
        return ImageGridView(capsuleID: newCapsule.objectID).environment(\.managedObjectContext, context)
            
    }
}
