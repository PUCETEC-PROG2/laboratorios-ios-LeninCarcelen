//
//  UserInfo.swift
//  GithubClient
//

import Foundation

struct UserInfo: Decodable {
    let id: Int
    let login: String
    let name: String?
    let avatarURL: String
    let bio: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case login
        case name
        case avatarURL = "avatar_url"
        case bio
    }
}
