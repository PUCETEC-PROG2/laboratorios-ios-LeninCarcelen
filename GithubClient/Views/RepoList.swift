//
//  RepoList.swift
//  GithubClient
//
//  Created by Usuario invitado on 7/7/26.
//

import SwiftUI

struct RepoList: View {
    @ObservedObject var viewController: RepoListViewController
    
    var body: some View {
        NavigationStack {
            Group {
                if viewController.isLoading {
                    ProgressView("Cargando repositorio...")
                } else if let errorMsg = viewController.errorMsg {
                    Text(errorMsg)
                        .foregroundStyle(.red)
                        .padding()
                } else {
                    List(viewController.repositories) { repo in
                        RepoItem(repository: repo)
                    }
                }
            }
            .navigationTitle("Repositorios")
        }
        .onAppear {
            if viewController.repositories.isEmpty {
                Task {
                    await viewController.loadRepositories()
                }
            }
        }
    }
}

#Preview {
    RepoList(viewController: RepoListViewController())
}
