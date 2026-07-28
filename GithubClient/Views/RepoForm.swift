//
//  RepoForm.swift
//  GithubClient
//
//  Created by Usuario invitado on 7/7/26.
//

import SwiftUI
import Foundation

struct RepoForm: View {
    @StateObject private var viewController = RepoFormViewController()
    @Binding var selectTab : Int
    
    var body: some View {
        NavigationStack {
            VStack {
                if viewController.isLoading {
                    ProgressView("Creando repositorio..")
                } else if let  errorMsg = viewController.errorMsg{
                    Text (errorMsg)
                        .foregroundStyle(.red)
                        .padding()
                } else {
                    Spacer ()
                    TextField (
                        "Nombre del repositorio",
                        text: $viewController.repoName
                    )
                    TextField(
                        "Descripción del repositorio",
                        text: $viewController.repoDescription,
                        axis: .vertical
                        
                    )
                    .textFieldStyle(.roundedBorder)
                    .lineLimit(3...6)
                    .padding(.vertical)
                    
                    if viewController.isLoading {
                        ProgressView("Guardando...")
                            .padding()
                    }
                    
                    Spacer()
                    
                    HStack {
                        
                        Button(action: {
                        }) {
                            Label("Cancelar", systemImage: "xmark.circle")
                                .padding(.all, 4)
                                .foregroundStyle(.red)
                        }
                        .buttonStyle(.bordered)
                        .padding(.horizontal, 4)
                        
                        Button(action: {
                            Task {
                                await viewController.createRepository()
                                if viewController.errorMsg == nil {
                                    selectTab = 0
                                }
                            }
                        }) {
                            Label("Guardar", systemImage: "square.and.arrow.down")
                                .padding(.all, 4)
                        }
                        .buttonStyle(.borderedProminent)
                        .disabled(viewController.repoName.trimmingCharacters(in: .whitespaces).isEmpty || viewController.isLoading)
                    }
                    .padding()
                }
            }
            .padding(.horizontal)
            .navigationTitle("Formulario de Repositorio")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    RepoForm(selectTab: .constant(1))
}
