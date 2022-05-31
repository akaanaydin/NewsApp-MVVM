//
//  NewsModel.swift
//  NewsApp MVVM
//
//  Created by Arslan Kaan AYDIN on 31.05.2022.
//

import Foundation


// MARK: - News
struct News: Codable {
    let articles: [Article]?
}

// MARK: - Article
struct Article: Codable {
    let source: Source?
    let author: String?
    let title, articleDescription: String?
    let url: String?
    let urlToImage: String?
    //let publishedAt: Date?
    let content: String?

    enum CodingKeys: String, CodingKey {
        case source, author, title
        case articleDescription = "description"
        case url, urlToImage, content
    }
}

// MARK: - Source
struct Source: Codable {
    let id: String?
    let name: String?
}
