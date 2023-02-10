//
//  UsersResponseModel.swift
//  InterViewProject
//
//  Created by UW-IN-LPT0108 on 2/9/23.
//

import Foundation

// MARK: - UsersData
struct UsersData: Codable, Hashable {
    var results: [Result]?
}

// MARK: - Result
struct Result: Codable, Hashable {
    var gender: String?
    var name: Name?
    var email: String?
    var dob: Dob?
    var phone, cell: String?
    var picture: Picture?
}

// MARK: - Dob
struct Dob: Codable, Hashable {
    var date: String?
    var age: Int?
}

// MARK: - Name
struct Name: Codable, Hashable {
    var title, first, last: String?
    
    var fullName: String {
        return (title ?? "") + " " + (first ?? "") + " " + (last ?? "")
    }
}

// MARK: - Picture
struct Picture: Codable, Hashable {
    var large, medium, thumbnail: String
}

typealias UsersResponseModel = UsersData
