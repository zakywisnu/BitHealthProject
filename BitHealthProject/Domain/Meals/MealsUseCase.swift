//
//  MealsUseCase.swift
//  BitHealthProject
//
//  Created by Ahmad Zaky W on 09/10/23.
//

import Foundation
import Combine

public protocol MealsUseCase {
    func loadMeals(request: URLRequest, completion: @escaping (Result<[Meals], Error>) -> Void)
}

extension MealsUseCase {
    func loadMealsPublisher(request: URLRequest) -> AnyPublisher<[Meals], Error> {
        return Deferred {
            Future { completion in
                self.loadMeals(request: request, completion: completion)
            }
        }
        .eraseToAnyPublisher()
    }
}

public final class MealsUseCaseDefault: MealsUseCase {
    
    private let httpClient: HTTPClient
    
    public init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    public func loadMeals(request: URLRequest, completion: @escaping (Result<[Meals], Error>) -> Void) {
        httpClient.performRequest(request) { result in
            switch result {
            case let .success((data ,response)):
                do {
                    let meals = try MealsMapper.map(data, from: response)
                    completion(.success(meals))
                } catch {
                    completion(.failure(NSError(domain: "Failed to serialize", code: 999)))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
