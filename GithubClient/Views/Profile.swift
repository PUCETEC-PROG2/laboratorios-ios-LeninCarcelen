//
//  Profile.swift
//  GithubClient
//
//  Created by Usuario invitado on 7/7/26.
//

import SwiftUI

struct Profile: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Lenin Carcelen")
                    .font(.title)
                Image(uiImage: .githubLogo)
                    .resizable()
                    .scaledToFit()
                Text("LeninCarcelen")
                    .font(.headline)
                    .padding(.vertical)
                Text("Lo llenare después")
                    .font(.caption)
            }
            .padding()
            .navigationTitle("Perfil del Usuario")
        }
    }
}

#Preview {
    Profile()
}

