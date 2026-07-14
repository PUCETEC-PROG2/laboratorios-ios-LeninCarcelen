//
//  AppConfig.swift
//  GithubClient
//
//  Created by Usuario invitado on 14/7/26.
//

import Foundation

enum AppConfig {
    private static let filename = "config"
    
    private enum Keys {
        static let apiBaseURL = "API_BASE_URL"
        static let apiToken = "API_TOKEN"
    }
    
    // Se corrigió el nombre a 'config' y se definió el tipo explícito del diccionario
    private static var config: [String: Any] = {
        guard
            let url = Bundle.main.url(forResource: filename, withExtension: "plist"),
            let data = try? Data(contentsOf: url),
            // Se corrigió 'Data' por 'data' en minúscula y se casteó correctamente el diccionario
            let dict = try? PropertyListSerialization.propertyList(from: data, options: [], format: nil) as? [String: Any]
        else {
            fatalError("Unable to load \(filename).plist")
        }
        return dict
    }() // Se agregaron los paréntesis () para ejecutar la clausura inmediatamente
    
    static var apiBaseURL: String {
        // Se corrigieron los typos 'Keys.apuBaseURL' y 'puco'
        guard let value = config[Keys.apiBaseURL] as? String else {
            fatalError("No se pudo obtener la URL base de \(filename).plist")
        }
        return value
    }
    
    static var apiToken: String {
        // Se corrigió la lógica duplicada para que devuelva el token correctamente
        guard let value = config[Keys.apiToken] as? String else {
            fatalError("No se pudo obtener el API Token de \(filename).plist")
        }
        return value
    }
}

