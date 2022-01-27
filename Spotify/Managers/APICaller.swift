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
                    //print(result)
                    completion(.success(result))
                } catch {
                    print(error.localizedDescription)
                    completion(.failure(error))
                }
            }
            task.resume()
        }
    }

    public func getNewReleases(completion: @escaping ((Result<NewReleasesResponse, Error>)) -> Void) {
        createRequest(with: URL(string: Constants.baseAPIURL + "/browse/new-releases?limit=50"), type: .GET) { request in
            let task = URLSession.shared.dataTask(with: request) { data, _, error in
                guard let data = data, error == nil else {
                    completion(.failure(APIError.failedToGetData))
                    return
                }
                do {
                    let result = try JSONDecoder().decode(NewReleasesResponse.self, from: data)
                    //print(result)
                    completion(.success(result))
                } catch {
                    print(error)
                    completion(.failure(error))
                }
            }
            task.resume()
        }
    }

    public func getFeaturedPlayLists(completion: @escaping ((Result<FeaturedPlayListResponse, Error>) -> Void)) {
        createRequest(with: URL(string: Constants.baseAPIURL + "/browse/featured-playlists?limit=20"), type: .GET) { request in
            let task = URLSession.shared.dataTask(with: request) { data, _, error in
                guard let data = data, error == nil else {
                    completion(.failure(APIError.failedToGetData))
                    return
                }
                do {
                    let result = try JSONDecoder().decode(FeaturedPlayListResponse.self, from: data)
                        //JSONSerialization.jsonObject(with: data, options: .allowFragments)
                    //print(result)
                    completion(.success(result))
                } catch {
                    print(error)
                    completion(.failure(error))
                }
            }
            task.resume()
        }
    }

    public func getRecommendations(genres: Set<String>, completion: @escaping (Result<RecommendationsResponse, Error>) -> Void) {
        let seeds = genres.joined(separator: ",")
        createRequest(with: URL(string: Constants.baseAPIURL + "/recommendations?limit=40&seed_genres=\(seeds)"), type: .GET) { request in
            let task = URLSession.shared.dataTask(with: request) { data, _, error in
                guard let data = data, error == nil else {
                    completion(.failure(APIError.failedToGetData))
                    return
                }
                do {
                    let result = try JSONDecoder().decode(RecommendationsResponse.self, from: data)
                    //print(result)
                    completion(.success(result))
                } catch {
                    print(error)
                    completion(.failure(error))
                }
            }
            task.resume()
        }
    }

    public func getRecommendationsGenres(completion: @escaping (Result<RecommendedGenresResponse, Error>) -> Void) {
        createRequest(with: URL(string: Constants.baseAPIURL + "/recommendations/available-genre-seeds"), type: .GET) { request in
            let task = URLSession.shared.dataTask(with: request) { data, _, error in
                guard let data = data, error == nil else {
                    completion(.failure(APIError.failedToGetData))
                    return
                }
                do {
                    let result = try JSONDecoder().decode(RecommendedGenresResponse.self, from: data)
                    //print(result)
                    completion(.success(result))
                } catch {
                    print(error)
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
