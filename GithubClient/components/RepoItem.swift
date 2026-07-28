//
//  RepoItem.swift
//  GithubClient
//
//  Created by Usuario invitado on 7/7/26.
//

import SwiftUI

struct RepoItem: View {
    let repository: Repository
    let onEdit: () -> Void
    let onDelete: () -> Void

    var body: some View {
        HStack(spacing: 12) {
            if let url = URL(string: repository.owner.avatarUrl) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    Image("githubLogo")
                        .resizable()
                        .scaledToFill()
                }
                .frame(width: 80, height: 80)
                .clipShape(Circle())
            } else {
                Image("githubLogo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
            }

            VStack(alignment: .leading, spacing: 5) {
                Text(repository.name)
                    .font(.title2)
                    .bold()

                if let description = repository.description, !description.isEmpty {
                    Text(description)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }

                if let language = repository.language, !language.isEmpty {
                    HStack {
                        Text("Lenguaje")
                            .font(.caption)
                        Spacer()
                        Text(language)
                            .font(.caption)
                            .bold()
                    }
                }
            }

            Spacer()

            VStack(spacing: 8) {
                Button(action: onEdit) {
                    Image(systemName: "pencil.circle.fill")
                        .font(.title2)
                        .foregroundStyle(.blue)
                }
                .buttonStyle(.plain)

                Button(action: onDelete) {
                    Image(systemName: "trash.circle.fill")
                        .font(.title2)
                        .foregroundStyle(.red)
                }
                .buttonStyle(.plain)
            }
        }
        .padding()
    }
}

#Preview {
    RepoItem(
        repository: Repository(
            id: 1,
            name: "Lenin Carcelen",
            description: "Programador ios Junior",
            language: "Swift",
            owner: UserInfo(
                login: "LeninCarcelen",
                name: "Lenin Carcelen",
                avatarUrl: "https://avatars.githubusercontent.com/u/173552925?v=4",
                bio: "esta es una prueba"
            )
        ),
        onEdit: {},
        onDelete: {}
    )
}
