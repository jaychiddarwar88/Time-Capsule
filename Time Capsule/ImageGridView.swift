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
    
    var fetchRequest: FetchRequest<ContentEntity>
        var contents: FetchedResults<ContentEntity> { fetchRequest.wrappedValue }
        let columns = [GridItem(.adaptive(minimum: 100))]

        init(capsuleID: NSManagedObjectID) {
            fetchRequest = FetchRequest<ContentEntity>(
                entity: ContentEntity.entity(),
                sortDescriptors: [],
                predicate: NSPredicate(format: "type == %@ AND capsule == %@", "IMAGE", capsuleID)
            )
        }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(contents, id: \.self) { content in
                        if let imageData = content.imageContent, let uiImage = UIImage(data: imageData) {
                            Image(uiImage: uiImage)
                                .resizable()
                                .scaledToFit()
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
