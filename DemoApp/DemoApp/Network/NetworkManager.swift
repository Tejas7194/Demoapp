//
//  NetworkManager.swift
//  DemoApp
//
// Created by Tejas Todkar on 26/12/24.
//

import Foundation
import Alamofire

var __CONTENT_SERVER_ADDRESS__ = "https://randomuser.me/api/?results=100"

protocol NetworkManagerProtocol: AnyObject {
    func fetchContent() async throws -> [ContentResult]
}

class NetworkManager: NetworkManagerProtocol {
    static var shared = NetworkManager()
    
    init() {}

    func fetchContent() async throws -> [ContentResult] {        
        return try await withCheckedThrowingContinuation { continuation in
            AF.request(__CONTENT_SERVER_ADDRESS__, method: .get).responseDecodable(of: APIResponse.self) { response in
                switch response.result {
                case .success(let apiResponse):
                    continuation.resume(returning: apiResponse.results ?? [])
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }

}
