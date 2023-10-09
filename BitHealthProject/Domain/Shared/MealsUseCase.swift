//
//  MealsUseCase.swift
//  BitHealthProject
//
//  Created by Ahmad Zaky W on 09/10/23.
//

import Foundation
import Combine

public protocol MealsUseCase {
    associatedtype Response
    func loadMeals(request: URLRequest, completion: @escaping (Result<Response, Error>) -> Void)
}

extension MealsUseCase {
    func loadMealsPublisher(request: URLRequest) -> AnyPublisher<Response, Error> {
        return Deferred {
            Future { completion in
                self.loadMeals(request: request, completion: completion)
            }
        }
        .eraseToAnyPublisher()
    }
}
