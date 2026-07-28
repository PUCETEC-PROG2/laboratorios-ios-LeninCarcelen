//
//  RepoList.swift
//  GithubClient
//
//  Created by Usuario invitado on 7/7/26.
//

import SwiftUI

struct RepoList: View {
    @StateObject private var viewController = RepoListViewController()
    @State private var editingRepository: Repository?
    @State private var editedName = ""
    @State private var editedDescription = ""

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
                        RepoItem(
                            repository: repo,
                            onEdit: {
                                editingRepository = repo
                                editedName = repo.name
                                editedDescription = repo.description ?? ""
                            },
                            onDelete: {
                                deleteRepository(repo)
                            }
                        )
                    }
                }
            }
            .navigationTitle("Repositorios")
            .sheet(item: $editingRepository) { _ in
                NavigationStack {
                    Form {
                        Section(header: Text("Editar repositorio")) {
                            TextField("Nombre", text: $editedName)
                            TextField("Descripción", text: $editedDescription, axis: .vertical)
                                .lineLimit(3...6)
                        }

                        Section {
                            HStack {
                                Spacer()
                                Button("Cancelar") {
                                    editingRepository = nil
                                }
                                .foregroundStyle(.secondary)

                                Button("Guardar") {
                                    saveEditedRepository()
                                }
                                .buttonStyle(.borderedProminent)
                            }
                        }
                    }
                    .navigationTitle("Editar repositorio")
                    .toolbar {
                        ToolbarItem(placement: .topBarLeading) {
                            Button("Cancelar") {
                                editingRepository = nil
                            }
                        }
                        ToolbarItem(placement: .topBarTrailing) {
                            Button("Guardar") {
                                saveEditedRepository()
                            }
                        }
                    }
                }
            }
        }
        .onAppear {
            Task {
                await viewController.loadRepositories()
            }
        }
    }

    private func deleteRepository(_ repository: Repository) {
        viewController.repositories.removeAll { $0.id == repository.id }
    }

    private func saveEditedRepository() {
        guard let repository = editingRepository else { return }

        if let index = viewController.repositories.firstIndex(where: { $0.id == repository.id }) {
            viewController.repositories[index].name = editedName.trimmingCharacters(in: .whitespacesAndNewlines)
            viewController.repositories[index].description = editedDescription.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? nil : editedDescription.trimmingCharacters(in: .whitespacesAndNewlines)
        }

        editingRepository = nil
    }
}

#Preview {
    RepoList()
}
