//
//  Profile.swift
//  GithubClient
//
//  Created by Usuario invitado on 7/7/26.
//

import SwiftUI

struct Profile: View {
    @StateObject private var viewController = ProfileViewController()

    var body: some View {
        NavigationStack {
            Group {
                if viewController.isLoading {
                    ProgressView("Cargando Perfil...")
                } else if let errorMsg = viewController.errorMsg {
                    Text(errorMsg)
                        .foregroundStyle(.red)
                        .padding()
                } else if let user = viewController.user {
                    VStack(alignment: .leading, spacing: 12) {
                        
                        AsyncImage(url: URL(string: user.avatarUrl)) { image in
                            image
                                .resizable()
                                .scaledToFill()
                        } placeholder: {
                            Image(uiImage: .githubLogo)
                                .resizable()
                                .scaledToFit()
                        }
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                        .padding(.bottom, 8)
                        
                        Text(user.name ?? user.login)
                            .font(.title)
                            .bold()
                            .multilineTextAlignment(.center)
                        
                        Text("@\(user.login)")
                            .font(.headline)
                            .foregroundStyle(.secondary)
                            
                        
                       
                        if let bio = user.bio, !bio.isEmpty {
                            Text(bio)
                                .font(.body)
                                .padding(.top, 4)
                                
                        }
                        
                        Spacer()
                    }
                    .padding()
                }
            }
            .navigationTitle("Perfil")
        }
        .task {
            await viewController.loadUserProfile()
        }
    }
}

#Preview {
    Profile()
}
