//
//  RepoForm.swift
//  GithubClient
//
//  Created by Usuario invitado on 7/7/26.
//

import SwiftUI

struct RepoForm: View {
    @State private var repoName: String = ""
    @State private var repoDescription: String = ""
    
    var body: some View {
        NavigationStack{
            VStack{
                TextField("",
                          text: $repoName,
                          prompt: Text("Nombre del repositorio")
                            .foregroundStyle(.black.opacity(0.4))
                        )
                .textFieldStyle(.roundedBorder)
                .padding()
                
                TextField("",
                          text: $repoDescription,
                          prompt: Text("Descripcion del repositorio")
                        .foregroundStyle(.black.opacity(0.4))
                )
                .textFieldStyle(.roundedBorder)
                .lineLimit(3...6)
                .padding(.vertical)
                
                Spacer()
                
                HStack{
                    Button(action:{
                        print("Boton Precionar")
                    }){
                        Label("Cancelar", systemImage: "xmark.circle")
                            .padding(.all, 4)
                            .foregroundStyle(.red)
                            
                    }
                    .padding(.horizontal)
                    .buttonStyle(.bordered)
                }
                
                Button(action:{
                    print("Boton Precionar")
                }){
                    Label("guardar", systemImage: "square.and.arrow.down")
                        .padding(.all, 4)
                }
                .buttonStyle(.borderedProminent)
                .padding(.horizontal)
            }
            .padding()
            .navigationTitle("Formulario del Repositorio")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
#Preview {
    RepoForm()
}
