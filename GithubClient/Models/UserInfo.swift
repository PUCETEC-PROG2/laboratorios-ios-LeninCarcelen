//
//  UserInfo.swift
//  GithubClient
//
//  Created by Usuario invitado on 14/7/26.
//

import Foundation

struct UserInfo: Decodable {
    let id: String
    let name: String
    let avatarURL: String
    let bio: String
    
    enum CodingKeys: String, Codable {
        case login
        case name
        case avatarURL = "avatar_url"
        case bio
    }
}
