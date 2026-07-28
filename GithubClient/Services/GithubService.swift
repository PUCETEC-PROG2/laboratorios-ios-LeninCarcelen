import Foundation
import Alamofire

class Githubservice {
    static let shared = Githubservice()
    private let baseUrl = AppConfig.apiBaseURL
    
    private init() {}
    
    private var headers: HTTPHeaders {
        [
            "Authorization": "Bearer \(AppConfig.apiToken)",
            "Accept": "application/vnd.github+json",
            "User-Agent": "GithubClientApp"
        ]
    }
    
    func getRepositories() async throws -> [Repository] {
        return try await AF.request(
            "\(baseUrl)/user/repos",
            method: .get,
            parameters: [
                "sort": "created",
                "direction": "desc",
                "per_page": 100,
                "affiliation": "owner",
                "t": NSDate ().timeIntervalSince1970
            ],
            headers: headers
        )
        .validate(statusCode: 200..<300)
        .serializingDecodable([Repository].self)
        .value
    }
    
    func createRepository(name: String, desc: String) async throws -> Repository {
        let cleanName = name.trimmingCharacters(in: .whitespacesAndNewlines)
        let cleanDesc = desc.trimmingCharacters(in: .whitespacesAndNewlines)
        
        var parameters: [String: Any] = [
            "name": cleanName
        ]
        if !cleanDesc.isEmpty {
            parameters["description"] = cleanDesc
        }

        let response = await AF.request(
            "\(baseUrl)/user/repos",
            method: .post,
            parameters: parameters,
            encoding: JSONEncoding.default,
            headers: headers
        )
        .validate()
        .serializingDecodable(Repository.self)
        .response

        if let data = response.data,
           let json = String(data: data, encoding: .utf8) {
            print("Response Body:")
            print(json)
        }

        switch response.result {
        case .success(let repo):
            return repo
        case .failure(let error):
            print("=== Alamofire Error ===")
            print(error)
            throw error
        }
    }
}
