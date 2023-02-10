//
//  UsersListView.swift
//  InterViewProject
//
//  Created by UW-IN-LPT0108 on 2/9/23.
//

import SwiftUI

struct UsersListView: View {
    @StateObject var viewModel = UsersViewModel()
    @State private var image: UIImage = UIImage()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.usersData, id: \.self) { user in
                    NavigationLink(destination: UserDetails(user: user)) {
                        HStack(spacing: 10) {
                            UserImageView(urlString: user.picture?.thumbnail ?? "")
                                .frame(width: 60, height: 60)
                                .cornerRadius(30)
                            
                            VStack(alignment: .leading, spacing: 5) {
                                Text(user.name?.fullName ?? "")
                                    .fontWeight(.semibold)
                                Text("Age: \(user.dob?.age ?? 0)")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
            }
        }
        .onAppear {
            viewModel.fecthUsersBased(on: 50)
        }
    }
}
