//
//  UserImageViewModel.swift
//  InterViewProject
//
//  Created by UW-IN-LPT0108 on 2/10/23.
//

import Foundation

class UserImageViewModel: ObservableObject {
    @Published var imageData = Data()
    
    func loadImage(using urlString: String) {
        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else { return }
                DispatchQueue.main.async {
                    self.imageData = data
                }
            }
            .resume()
        }
    }
}
