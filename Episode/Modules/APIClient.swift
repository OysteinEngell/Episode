//
//  APIClient.swift
//  Episode
//
//  Created by Øystein Engell on 23/10/2023.
//

import Foundation

struct APIClient {
    var getTVShows: () async throws -> [TVShow]
}

extension APIClient {
    static let live = APIClient(getTVShows: {
        let apiKey = ""
        let urlString = "https://api.themoviedb.org/3/trending/tv/day?language=en-US&api_key=\(apiKey)"
        
        guard let url = URL(string: urlString) else {
            throw MyError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let response = try decoder.decode(Response.self, from: data)
        return response.results
    })
}

struct Response: Codable {
    let results: [TVShow]
    // You can add other properties from the response if needed
}

enum MyError: Error {
    case invalidURL
}






