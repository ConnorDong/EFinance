//
//  NewsEndpoint.swift
//  StocksApp
//
//  Created by connor dong on 2021-05-02.
//

import Foundation

protocol APIBuilder {
    var urlRequest: URLRequest {get}
    var baseUrl : URL {get}
    var path : URLComponents {get}
}

enum NewsAPI {
    case getNews
}
extension NewsAPI : APIBuilder {
    var urlRequest: URLRequest {
        return URLRequest(url: self.path.url!)
    }
    
    var baseUrl: URL {
        switch self{
        case .getNews:
            return URL(string: "https://newsapi.org")!
        }
    }
    
    var path: URLComponents {
        let url = self.baseUrl.absoluteString;
        var urlComponents = URLComponents(string: url)!
        urlComponents.path = "/v2/top-headlines"
        urlComponents.queryItems = [URLQueryItem(name: "country", value: "us"), URLQueryItem(name: "category", value: "business"), URLQueryItem(name: "apiKey", value: "4b98a711a6cd479989f3a1cbdb89ee71")]
        return urlComponents
    }
    
    
}
