//
//  UserDetails.swift
//  InterViewProject
//
//  Created by UW-IN-LPT0108 on 2/10/23.
//

import SwiftUI

struct UserDetails: View {
    @State var user: Result
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 25) {
                UserImageView(urlString: user.picture?.large ?? "")
                    .frame(width: 350, height: 350)
                    .cornerRadius(20)
                
                VStack(alignment: .leading, spacing: 5) {
                    UserInformationText(title: "Name:", description: user.name?.fullName ?? "")
                    UserInformationText(title: "Age:", description: "\(user.dob?.age ?? 0)")
                    UserInformationText(title: "e-mail:", description: user.email ?? "")
                    UserInformationText(title: "Phone No:", description: user.phone ?? "")
                }
            }
        }
        .navigationTitle("User Details")
        .foregroundColor(.brown)
    }
}
