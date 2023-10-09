//
//  MealsViewModel.swift
//  BitHealthProject
//
//  Created by Ahmad Zaky W on 05/10/23.
//

import UIKit
import Combine

public enum MealsRoute {
    case details(String)
    case image(String)
    case logout
}

public protocol MealsViewModel {
    var mealsPublisher: CurrentValueSubject<[Meals], Never> { get }
    var isLoading: CurrentValueSubject<Bool, Never> { get }
    var meals: [Meals] { get }
    
    func loadMeals()
    func navigate(to: MealsRoute)
    func changeMeals(letter: String)
}

public final class MealsViewModelDefault: MealsViewModel {
    private var routeHandler: (MealsRoute) -> Void
    private var cancellable: Cancellable?
    private let interactor: MealsInteractor
    private var letter: String = "a"
    
    public init(
        interactor: MealsInteractor,
        routeHandler: @escaping (MealsRoute) -> Void
    ) {
        self.interactor = interactor
        self.routeHandler = routeHandler
    }
    
    public var mealsPublisher: CurrentValueSubject<[Meals], Never> = .init([])
    public var isLoading: CurrentValueSubject<Bool, Never> = .init(false)
    
    public var meals: [Meals] {
        mealsPublisher.value
    }
    
    public func loadMeals() {
        isLoading.send(true)
        mealsPublisher.send([])
        let urlRequest = MealsEndpoint(letter: letter).makeURLRequest()
        cancellable = interactor.loadMealsPublisher(request: urlRequest)
            .sink { [weak self] completion in
                switch completion {
                case .finished: break
                case let .failure(error):
                    print("error: ", error)
                }
                self?.isLoading.send(false)
            } receiveValue: { [weak self] meals in
                guard let self = self else { return }
                self.mealsPublisher.send(meals)
            }
    }
    
    public func navigate(to route: MealsRoute) {
        routeHandler(route)
    }
    
    public func changeMeals(letter: String) {
        self.letter = letter
        loadMeals()
    }
}
