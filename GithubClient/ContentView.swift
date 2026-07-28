//
//  ContentView.swift
//  GithubClient
//
//  Created by Usuario invitado on 13/1/26.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Int = 0
    @StateObject private var repoListViewController = RepoListViewController()

    var body: some View {
        TabView(selection: $selectedTab) {
            RepoList(viewController: repoListViewController)
                .tabItem {
                    Label("Repositorios", systemImage: "arrow.triangle.branch")
                }
                .tag(0)

            RepoForm(selectTab: $selectedTab, repoListViewController: repoListViewController)
                .tabItem {
                    Label("Crear", systemImage: "plus.circle.fill")
                }
                .tag(1)

            Profile()
                .tabItem {
                    Label("Perfil", systemImage: "person.crop.circle")
                }
                .tag(2)
        }
    }
}

#Preview {
    ContentView()
}
