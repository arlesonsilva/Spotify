//
//  APICaller.swift
//  Spotify
//
//  Created by Arleson Silva on 17/01/22.
//

import Foundation
import QuartzCore

enum HTTPMethod: String {
    case GET
    case POST
}

enum APIError: Error {
    case failedToGetData
}

final class APICaller {
    static let shared = APICaller()

    struct Constants {
        static let baseAPIURL = "https://api.spotify.com/v1"
    }

    private init() {}

    public func getCurrentUserProfile(completion: @escaping(Result<UserProfile, Error>) -> Void) {
        createRequest(with: URL(string: Constants.baseAPIURL + "/me"), type: .GET) { baseRequest in
            let task = URLSession.shared.dataTask(with: baseRequest) { data, _, error in
                guard let data = data, error == nil else {
                    completion(.failure(APIError.failedToGetData))
                    return
                }
                do {
                    let result = try JSONDecoder().decode(UserProfile.self, from: data)
                    print(result)
                } catch {
                    completion(.failure(error))
                }
            }
            task.resume()
        }
    }
    
    // MARK: - Private
    private func createRequest(with url: URL?, type: HTTPMethod, completion: @escaping (URLRequest) -> Void) {
        AuthManager.shared.withValidToken { token in
            guard let apiURL = url else { return }
            var request = URLRequest(url: apiURL)
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            completion(request)
        }
    }
}
