//
//  ServiceManager.swift
//  NewsApp MVVM
//
//  Created by Arslan Kaan AYDIN on 31.05.2022.
//

import Foundation
import Alamofire


protocol ServicesProtocol {
    func fetchTopNews(paramaters: [String: Any]?, data: Codable?, onSuccess: @escaping (News?) -> Void, onError: @escaping (AFError) -> Void)
    func searchNews(searchText: String, sortType: String, onSuccess: @escaping (News?) -> Void, onError: @escaping (AFError) -> Void)
}

final class Services: ServicesProtocol {
    
    func fetchTopNews(paramaters: [String : Any]?, data: Codable?, onSuccess: @escaping (News?) -> Void, onError: @escaping (AFError) -> Void) {
        ServiceManager.shared.fetch(path: Constant.NetworkConstant.NewsGameServiceEndPoint.fetchTopNews(), paramaters: nil, data: nil, method: .get) { (response: News) in
            onSuccess(response)
            print(response)
        } onError: { error in
            onError(error)
            print(error)
        }

    }
    
    func searchNews(searchText: String, sortType: String, onSuccess: @escaping (News?) -> Void, onError: @escaping (AFError) -> Void) {
        ServiceManager.shared.fetch(path: Constant.NetworkConstant.NewsGameServiceEndPoint.searchNews(searchText: searchText, sortType: sortType), paramaters: nil, data: nil, method: .get) { (response: News) in
            onSuccess(response)
            print(response)
        } onError: { error in
            onError(error)
            print(error)
        }

    }
    
}
