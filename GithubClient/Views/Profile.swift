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
            VStack(alignment: .leading) {
                Text("Alejandro Vargas")
                    .font(.title)
                Image(uiImage: .githubLogo)
                    .resizable()
                    .scaledToFit()
                
                Text("VargasAlejandro27")
                    .font(.headline)
                    .padding(.vertical)
                
                Text("7 palabras Esenciaaaa")
            }
            .navigationTitle("Perfil de usuario")
        }
    }
}

#Preview {
    Profile()
}
