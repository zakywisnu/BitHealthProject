//
//  MealsViewModel.swift
//  BitHealthProject
//
//  Created by Ahmad Zaky W on 05/10/23.
//

import Foundation
import Combine

public protocol MealsViewModel {
    var mealsPublisher: CurrentValueSubject<[Meals], Never> { get }
    var meals: [Meals] { get }
    
    func loadMeals()
    func routeDetail(id: String)
}

public final class MealsViewModelDefault: MealsViewModel {
    private let useCase: MealsUseCase
    private var cancellable: Cancellable?
    private var routeToDetail: ((String) -> Void)
    
    public init(useCase: MealsUseCase, routeToDetail: @escaping (String) -> Void) {
        self.useCase = useCase
        self.routeToDetail = routeToDetail
    }
    
    public var mealsPublisher: CurrentValueSubject<[Meals], Never> = .init([])
    
    public var meals: [Meals] {
        mealsPublisher.value
    }
    
    public func loadMeals() {
        let urlRequest = MealsEndpoint(letter: "a").makeURLRequest()
        cancellable = useCase.loadMealsPublisher(request: urlRequest)
            .sink { completion in
                switch completion {
                case .finished: break
                case let .failure(error):
                    print("error: ", error)
                }
            } receiveValue: { [weak self] meals in
                guard let self = self else { return }
                self.mealsPublisher.send(meals)
            }
    }
    
    public func routeDetail(id: String) {
        routeToDetail(id)
    }
}
