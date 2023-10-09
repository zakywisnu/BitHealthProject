//
//  MealsComposer.swift
//  BitHealthProject
//
//  Created by Ahmad Zaky W on 05/10/23.
//

import Foundation

public final class MealsComposer {
    public static func composeMeals(
        httpClient: HTTPClient,
        routeToDetail: @escaping (String) -> Void
    ) -> MealsViewController {
        let interactor = MealsInteractor(httpClient: httpClient)
        let viewModel = MealsViewModelDefault(interactor: interactor, routeToDetail: routeToDetail)
        let vc = MealsViewController(viewModel: viewModel)
        return vc
    }
}
