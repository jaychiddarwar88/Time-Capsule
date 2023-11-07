//
//  ImageGridView.swift
//  Time Capsule
//
//  Created by Jay Chiddarwar on 11/4/23.
//

import SwiftUI

struct ImageGridView: View {
    @FetchRequest(sortDescriptors: [])
    private var content: FetchedResults<ContentEntity>
    
    var body: some View {
        NavigationStack {
            
        }
        .navigationTitle("Images")
    }
}

struct ImageGridView_Preview: PreviewProvider {
    static var previews: some View {
        ImageGridView()
    }
}
