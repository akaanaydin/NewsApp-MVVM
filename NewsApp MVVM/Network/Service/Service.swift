//
//  Service.swift
//  NewsApp MVVM
//
//  Created by Arslan Kaan AYDIN on 31.05.2022.
//

import Foundation
import Alamofire

final class ServiceManager {
    
    public static let shared: ServiceManager = ServiceManager()
}

extension ServiceManager {
    
    func fetch<T>(path: String, paramaters paramatres: [String : String]?, data: Codable?, method: HTTPMethod, onSuccess: @escaping (T) -> Void, onError: @escaping (AFError) -> Void) where T : Decodable, T : Encodable {
        
        let param = generateData(data: data)
        AF.request(path,
                   method: method,
                   parameters: param,
                   encoding: JSONEncoding.default
        ).validate().responseDecodable(of: T.self) { (response) in
            print(T.self)
            guard let model = response.value else {
                print(response.error as Any)
                return
            }
            onSuccess(model)
        }
    }
    
    func generateData(data: Codable?) -> [String : Any]? {
        if let data = data {
            do {
                return try data.asDictionary()
            } catch {}
        }
        return nil
    }
}
