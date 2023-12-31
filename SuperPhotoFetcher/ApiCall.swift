//
//  ApiCall.swift
//  SuperPhotoFetcher
//
//  Created by mac on 6/28/23.
//

import Foundation

class ApiCall {
    static func getPhotos(completion: @escaping ([Photo]) -> ()) {
        let getPhotoUrlString = "https://jsonplaceholder.typicode.com/photos"
        guard let url = URL(string: getPhotoUrlString) else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let data = data {
                if let photos = try? JSONDecoder().decode([Photo].self, from: data) {
                    DispatchQueue.main.async {
                        completion(photos)
                    }
                    return
                }
            }
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown erorr")")
            
        }.resume() 
    }
}
