//
//  NewsHomeViewModel.swift
//  NewsApp MVVM
//
//  Created by Arslan Kaan AYDIN on 31.05.2022.
//

import Foundation
import Alamofire

protocol NewsProtocol {
    func fetchTopNews(onSuccess: @escaping (News?) -> Void, onError: @escaping (AFError) -> Void)
    func searchNews(searchText: String, sortType: String, onSuccess: @escaping (News?) -> Void, onError: @escaping (AFError) -> Void)
    
    var delegate: NewsOutput? { get set }
}

final class NewsHomeViewModel: NewsProtocol {
    
    var delegate: NewsOutput?

    private var service: ServicesProtocol
    
    init(service:ServicesProtocol) {
        self.service = service
    }
}


extension NewsHomeViewModel {
    func fetchTopNews(onSuccess: @escaping (News?) -> Void, onError: @escaping (AFError) -> Void) {
        service.fetchTopNews(paramaters: nil, data: nil) { news in
            onSuccess(news)
        } onError: { error in
            onError(error)
        }

    }
    
    func searchNews(searchText: String, sortType: String, onSuccess: @escaping (News?) -> Void, onError: @escaping (AFError) -> Void) {
        service.searchNews(searchText: searchText, sortType: sortType) { [weak self] news in
            guard let self = self, let news = news else {
                onSuccess(nil)
                return
            }
            onSuccess(news)
        } onError: { error in
            onError(error)
        }

    }
}
