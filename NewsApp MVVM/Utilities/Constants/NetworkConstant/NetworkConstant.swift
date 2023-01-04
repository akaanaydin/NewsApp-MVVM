//
//  NetworkConstant.swift
//  NewsApp MVVM
//
//  Created by Arslan Kaan AYDIN on 31.05.2022.
//

import Foundation

extension Constant {
    class NetworkConstant{
        enum NewsGameServiceEndPoint: String {
        case BASE_URL = "https://newsapi.org/v2/"
        case API_KEY = "YOUR_API_KEY"
        case TOP_HEADLINES = "top-headlines"
        case EVERYTHING = "everything"
        case SORTBY = "sortedBy"
            
            static func fetchTopNews() -> String {
                "\(BASE_URL.rawValue)\(TOP_HEADLINES.rawValue)?country=us&apiKey=\(API_KEY.rawValue)"
            }
            
            static func searchNews(searchText: String, sortType: String) -> String {
                "\(BASE_URL.rawValue)\(EVERYTHING.rawValue)?q=\(searchText)&\(SORTBY.rawValue)=\(sortType)&apiKey=\(API_KEY.rawValue)"
            }
        }
    }
}
//https://newsapi.org/v2/top-headlines?country=us&apiKey=2cf47fd0502144d590c46bf2a61d7892
//https://newsapi.org/v2/everything?q=Apple&sortBy=popularity&apiKey=2cf47fd0502144d590c46bf2a61d7892
