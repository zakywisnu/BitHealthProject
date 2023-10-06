//
//  MealsViewModel.swift
//  BitHealthProject
//
//  Created by Ahmad Zaky W on 05/10/23.
//

import Foundation
import Combine

public protocol MealsViewModel {
    func loadMeals()
}

public final class MealsViewModelDefault: MealsViewModel {
    private let httpClient: HTTPClient
    private var cancellable: Cancellable?
    
    public init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    public func loadMeals() {
        let urlRequest = MealsEndpoint(letter: "a").makeURLRequest()
        cancellable = httpClient.getPublisher(urlRequest: urlRequest)
            .tryMap(MealsMapper.map)
            .sink { completion in
                switch completion {
                case .finished: break
                case let .failure(error):
                    print("error: ", error)
                }
            } receiveValue: { meals in
                print("meals: ", meals)
            }
    }
}
