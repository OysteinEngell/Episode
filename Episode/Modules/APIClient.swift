//
//  APIClient.swift
//  Episode
//
//  Created by Øystein Engell on 23/10/2023.
//

import Foundation

struct APIClient {
    var getTVShows: () async throws -> ()
}

extension APIClient {
    static let live = APIClient(getTVShows: {
        
        let headers = APIClientHeaders.headers
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.themoviedb.org/3/trending/tv/day?language=en-US")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error as Any)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse as Any)
                do{
                    let tvShowResponse = try JSONDecoder().decode(TVShowResponse.self, from: data!)
//                    print(tvShowResponse)
                    
                    let tvShowArray: [TVShow]
                    
                    for tvShow in tvShowResponse.results {
                        print("TV Show name: \(tvShow.name)")
                        print("TV Show overview: \(tvShow.overview)")
                        
                    }
                }catch let error{
                    print(error)
                }
                
            }
        })
        
        dataTask.resume()
        
    })
}

struct TVShowResponse: Codable {
    let page: Int
    let results: [TVShow]
    let total_pages: Int
    let total_results: Int
}





