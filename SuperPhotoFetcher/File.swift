//
//  File.swift
//  SuperPhotoFetcher
//
//  Created by mac on 6/28/23.
//

import Foundation


struct Photo: Codable, Hashable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}
