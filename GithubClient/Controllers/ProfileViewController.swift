//
//  ProfileViewController.swift
//  GithubClient
//
//  Created by Usuario invitado on 28/7/26.
//

import Foundation

@MainActor
class ProfileViewController: ObservableObject {
    @Published var user: UserInfo?
    @Published var isLoading: Bool = false
    @Published var errorMsg: String?
    
    private let githubServices: GithubService
    
    init(service: GithubService = .shared) {
        self.githubServices = service
    }
    
    func loadUserProfile() async {
        isLoading = true
        errorMsg = nil
        do {
            user = try await githubServices.getUserProfile()
        } catch {
            errorMsg = error.localizedDescription
        }
        isLoading = false
    }
}
