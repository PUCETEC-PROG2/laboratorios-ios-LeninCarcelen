//
//  RepoForm.swift
//  GithubClient
//
//  Created by Usuario invitado on 7/7/26.
//

import SwiftUI

struct RepoForm: View {
    var body: some View {
        NavigationStack{
            VStack{
                Text("Formulario del Repositorio")
            }
            .navigationTitle("Formulario del Repopsitorio")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
#Preview {
    RepoForm()
}