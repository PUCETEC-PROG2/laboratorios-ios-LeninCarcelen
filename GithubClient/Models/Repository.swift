//
//  Repository.swift
//  GithubClient
//
//  Created by Usuario invitado on 14/7/26.
//
import Foundation

struct Repository: Identifiable, Decodable {
    let id: Int
    var name: String
    var description: String?
    var language: String?
    let owner: UserInfo
}
