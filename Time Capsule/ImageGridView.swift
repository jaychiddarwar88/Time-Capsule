//
//  ImageGridView.swift
//  Time Capsule
//
//  Created by Jay Chiddarwar on 11/4/23.
//

import SwiftUI
import PhotosUI

struct ImageGridView: View {
    @FetchRequest(sortDescriptors: [],
                  predicate: NSPredicate(format: "type == %@", "IMAGE"))
    private var contents: FetchedResults<ContentEntity>
    let columns = [GridItem(.adaptive(minimum: 100))]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    // Loop over the filtered image contents
                    ForEach(contents, id: \.self) { content in
                        // Ensure that the content has image data before attempting to create an image
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


struct ImageGridView_Preview: PreviewProvider {
    static var previews: some View {
        ImageGridView()
    }
}
