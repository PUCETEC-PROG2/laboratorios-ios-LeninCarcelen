//
// RepoFormViewController.swift
// GithubClient
//
// Created by Usuario invitado on 21/7/26.
//

import Foundation

@MainActor
class RepoFormViewController: ObservableObject {
    @Published var repoName: String = ""
    @Published var repoDescription: String = ""
    @Published var repository: Repository? = nil
    @Published var isLoading: Bool = false
    @Published var errorMsg: String?

    private let githubService: GithubService
    private let listController: RepoListViewController?

    init(service: GithubService = .shared, listController: RepoListViewController? = nil) {
        self.githubService = service
        self.listController = listController
    }

    @discardableResult
    func createRepository() async -> Bool {
        isLoading = true
        errorMsg = nil
        defer { isLoading = false }

        do {
            let createdRepository = try await githubService.createRepository(
                name: repoName,
                desc: repoDescription
            )
            self.repository = createdRepository
            self.repoName = ""
            self.repoDescription = ""
            listController?.appendRepository(createdRepository)
            return true
        } catch {
            self.errorMsg = error.localizedDescription
            return false
        }
    }
}
