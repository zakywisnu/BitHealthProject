//
//  DetailMealsUseCase.swift
//  BitHealthProject
//
//  Created by Ahmad Zaky W on 09/10/23.
//

import Foundation
import Combine

public final class DetailMealsInteractor: MealsUseCase {

    public typealias Response = Meals
    
    private let httpClient: HTTPClient

    public init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }

    public func loadMeals(request: URLRequest, completion: @escaping (Result<Meals, Error>) -> Void) {
        httpClient.performRequest(request) { result in
            switch result {
            case let .success((data ,response)):
                do {
                    let meals = try MealsMapper.map(data, from: response)
                    completion(.success(meals[0]))
                } catch {
                    completion(.failure(NSError(domain: "Failed to serialize", code: 999)))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
