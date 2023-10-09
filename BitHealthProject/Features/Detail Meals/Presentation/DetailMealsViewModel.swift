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
}

public final class DetailMealsViewModelDefault: DetailMealsViewModel {
    
    private let interactor: DetailMealsInteractor
    private let id: String
    private var cancellable: Cancellable?
    
    public var detail: Meals? {
        detailPublisher
            .value
    }
    
    public var detailPublisher: CurrentValueSubject<Meals?, Never> = .init(nil)
    
    public init(id: String, interactor: DetailMealsInteractor) {
        self.id = id
        self.interactor = interactor
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
}
