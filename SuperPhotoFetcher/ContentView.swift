//
//  ContentView.swift
//  SuperPhotoFetcher
//
//  Created by mac on 6/28/23.
//

import SwiftUI

struct ContentView: View {
    @State var photos: [Photo] = []
    
    let columns = [GridItem](repeating: GridItem(.flexible()), count: 4)
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(photos, id: \.self) { photo in
                    PhotoView(photoData: photo)
                    
                }
            }.onAppear {
                ApiCall.getPhotos { photos in
                    self.photos = photos
                }
            }.padding(.horizontal)
        }.frame(width: 900, height: 800)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
