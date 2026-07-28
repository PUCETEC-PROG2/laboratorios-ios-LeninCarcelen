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
                Text("Lenin Carcelen")
                    .font(.title)
                
                Image("githubLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                
                Text("LeninCarcelen")
                    .font(.headline)
                    .padding(.vertical)
                
                Text("Programador junior de ios")
                
            }
            .navigationTitle("Perfil de usuario")
        }
    }
}

#Preview {
    Profile()
}
