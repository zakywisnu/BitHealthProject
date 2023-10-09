//
//  DetailMealsViewModel.swift
//  BitHealthProject
//
//  Created by Ahmad Zaky W on 08/10/23.
//

import Foundation
import Combine

public protocol DetailMealsViewModel {
    var detail: Meals? { get }
    var detailPublisher: CurrentValueSubject<Meals?, Never> { get }
    
    func loadDetails()
    func navigate()
}

public final class DetailMealsViewModelDefault: DetailMealsViewModel {
    
    private let interactor: DetailMealsInteractor
    private let id: String
    private var cancellable: Cancellable?
    private var routeFullscreen: (String) -> Void
    
    public var detail: Meals? {
        detailPublisher
            .value
    }
    
    public var detailPublisher: CurrentValueSubject<Meals?, Never> = .init(nil)
    
    public init(
        id: String,
        interactor: DetailMealsInteractor,
        routeFullscreen: @escaping (String) -> Void
    ) {
        self.id = id
        self.interactor = interactor
        self.routeFullscreen = routeFullscreen
    }
    
    public func loadDetails() {
        let urlRequest = DetailMealsEndpoint(id: id).makeURLRequest()
        cancellable = interactor.loadMealsPublisher(request: urlRequest)
            .sink { completion in
                switch completion {
                case .finished: break
                case let .failure(error):
                    print("error: ", error)
                }
            } receiveValue: { [weak self] meals in
                guard let self = self else { return }
                self.detailPublisher.send(meals)
            }

    }
    
    public func navigate() {
        routeFullscreen(detail?.strMealThumb ?? "")
    }
}
