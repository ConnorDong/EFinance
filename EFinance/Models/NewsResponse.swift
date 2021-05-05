//
//  NewsResponse.swift
//  EFinance
//
//  Created by connor dong on 2021-05-05.
//
import Foundation

// MARK: - Welcome
struct NewsResponse: Codable {
    let status: String?
    let totalResults: Int?
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable, Identifiable {
    let id = UUID();
    let source: Source?
    let author, title, articleDescription: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: Date?
    let content: String?
    
    enum CodingKeys: String, CodingKey {
        case source, author, title
        case articleDescription = "description"
        case url, urlToImage, publishedAt, content
    }}
// MARK: - Source
struct Source: Codable {
    let id: String?
    let name: String?
}

extension Article {
    static var DummyData: Article {
        .init(source: Source(id: "CNN", name: "CNN"), author:"Rachel Trent, CNN",
              title: "Billie Eilish shows off a new look on the cover of British Vogue - CNN ",
              articleDescription: "Billie Eilish is trading in her baggy pants and hoodies for catsuits and corsets.",
              url: "https://www.cnn.com/2021/05/02/entertainment/billie-eilish-vogue-body-image-trnd/index.html",
              urlToImage: "https://cdn.cnn.com/cnnnext/dam/assets/210502171816-billie-eilish-file-super-tease.jpg",
              publishedAt: Date(), content: "")
        
    }
}
