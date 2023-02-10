//
//  UsersViewModel.swift
//  InterViewProject
//
//  Created by UW-IN-LPT0108 on 2/9/23.
//

import Foundation
import Combine

class UsersViewModel: ObservableObject {
    private var cancellables = [AnyCancellable]()
    @Published var usersData = [Result]()
    
    func fecthUsersBased(on count: Int) {
        let urlString = "https://randomuser.me/api/?results=\(count)"
        
        if let url = URL(string: urlString) {
            URLSession.shared.dataTaskPublisher(for: url)
                .receive(on: RunLoop.main)
                .map(\.data)
                .decode(type: UsersResponseModel.self, decoder: JSONDecoder())
                .sink { value in
                    switch value {
                    case .failure(let error):
                        print(error)
                    case .finished:
                        print("API call got succeeded")
                    }
                } receiveValue: { [weak self] responseData in
                    if let users = responseData.results {
                        self?.usersData = users
                    }
                }
                .store(in: &cancellables)
        }
    }
}
