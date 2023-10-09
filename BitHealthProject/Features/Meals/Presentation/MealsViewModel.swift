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
    private var routeToDetail: ((String) -> Void)
    private var cancellable: Cancellable?
    private let interactor: MealsInteractor
    
    public init(interactor: MealsInteractor, routeToDetail: @escaping (String) -> Void) {
        self.interactor = interactor
        self.routeToDetail = routeToDetail
    }
    
    public var mealsPublisher: CurrentValueSubject<[Meals], Never> = .init([])
    
    public var meals: [Meals] {
        mealsPublisher.value
    }
    
    public func loadMeals() {
        let urlRequest = MealsEndpoint(letter: "a").makeURLRequest()
        cancellable = interactor.loadMealsPublisher(request: urlRequest)
            .sink { completion in
                switch completion {
                case .finished: break
                case let .failure(error):
                    print("error: ", error)
                }
            } receiveValue: { [weak self] meals in
                guard let self = self else { return }
                dump(meals)
                self.mealsPublisher.send(meals)
            }
    }
    
    public func routeDetail(id: String) {
        routeToDetail(id)
    }
}
