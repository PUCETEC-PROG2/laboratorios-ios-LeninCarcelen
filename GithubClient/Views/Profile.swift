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
            VStack(spacing: 16) {
                Text("Lenin Carcelen")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)

                Image("githubLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())

                Text("LeninCarcelen")
                    .font(.headline)
                    .foregroundStyle(.secondary)

                Text("Programador junior de iOS")
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
            .navigationTitle("Perfil de usuario")
        }
    }
}

#Preview {
    Profile()
}
