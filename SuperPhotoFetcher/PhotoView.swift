//
//  PhotoView.swift
//  SuperPhotoFetcher
//
//  Created by mac on 6/28/23.
//

import SwiftUI

struct PhotoView: View {
    var photoData:Photo
    
    @State var isHover = false
    
    var body: some View {
        Link(destination: URL(string: photoData.url)!) {
            ZStack(alignment: .bottom) {
                AsyncImage(url: URL(string: photoData.thumbnailUrl)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    Color.gray
                }.frame(width: 200, height: 200)
                
                if isHover {
                    Text(photoData.title)
                        .frame(width: 200)
                        .padding(5)
                        .lineLimit(2)
                }
            }.onHover { isHover in
                self.isHover = isHover
            }
        }
    }
}

struct PhotoView_Previews_Short: PreviewProvider {
    static var previews: some View {
        PhotoView(photoData: Photo(albumId: 1, id: 1, title: "Hey title", url: "https://via.placeholder.com/600/92c952", thumbnailUrl: "https://via.placeholder.com/600/92c952"))
    }
}

struct PhotoView_Previews_Long: PreviewProvider {
    static var previews: some View {
        PhotoView(photoData: Photo(albumId: 1, id: 1, title: "Hey title, Hey title,Hey title ,Hey title,Hey title, Hey title, Hey title, Hey title, Hey title, Hey title", url: "https://via.placeholder.com/600/92c952", thumbnailUrl: "https://via.placeholder.com/600/92c952"))
    }
}
