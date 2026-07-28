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
        static let apiBaseUrl = "API_BASE_URL"
        static let apiToken = "API_TOKEN"
    }

    private static let config: [String: Any] = {
        guard
            let url = Bundle.main.url(forResource: filename, withExtension: "plist"),
            let data = try? Data(contentsOf: url),
            let plist = try? PropertyListSerialization.propertyList(
                from: data,
                options: [],
                format: nil
            ),
            let dict = plist as? [String: Any]
        else {
            return [:]
        }

        return dict
    }()

    static var apiBaseURL: String {
        (config[Keys.apiBaseUrl] as? String) ?? "https://api.github.com"
    }

    static var apiToken: String {
        (config[Keys.apiToken] as? String) ?? ""
    }
}
