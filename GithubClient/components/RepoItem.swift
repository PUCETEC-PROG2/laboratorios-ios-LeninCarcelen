//
//  RepoItem.swift
//  GithubClient
//
//  Created by Usuario invitado on 7/7/26.
//

import SwiftUI

struct RepoItem: View {
    let repository: Repository
    var body: some View {
        HStack {
            AsyncImage (url: URL(string:
                                    repository.owner.avatarUrl)!) {Image in
                Image
                    .resizable()
                    .scaledToFill()

            }placeholder: {
                Image(uiImage: .githubLogo)
                    .resizable()
                    .scaledToFill()
            }
            .frame(width: 80, height: 80)
            
            Spacer()
            
            VStack(alignment: .leading, spacing: 5) {
                Text(repository.name)
                    .font(.title2)
                    .bold()
                if let description = repository.description {
                    Text(description)
                        .font(.caption)
                }
                if let Language = repository.language
                {
                    HStack {
                        Text("Lenguaje")
                            .font(.caption)
                        Spacer()
                        Text("Swift")
                            .font(.caption)
                            .bold()
                }
                }
            }
        }
        .padding()
    }
}

#Preview {
    RepoItem(
        repository:Repository(
            id:1,
            name: "Lenin Carcelen",
            description: "Programador ios Junior",
            language: "Swift",
            owner: UserInfo(
                login: "LeninCarcelen",
                name:"Lenin Carcelen",
                avatarUrl: "https://avatars.githubusercontent.com/u/173552925?v=4",
                bio: "esta es una prueba"
            )
        )
    )
}
