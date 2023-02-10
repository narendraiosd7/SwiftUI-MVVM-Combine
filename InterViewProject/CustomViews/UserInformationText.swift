//
//  UserInformationText.swift
//  InterViewProject
//
//  Created by UW-IN-LPT0108 on 2/10/23.
//

import SwiftUI

struct UserInformationText: View {
    var title: String
    var description: String
    
    var body: some View {
        HStack {
            Text(title)
                .fontWeight(.bold)
            Text(description)
                .fontWeight(.semibold)
        }
    }
}
