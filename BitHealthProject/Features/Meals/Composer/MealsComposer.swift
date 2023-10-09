//
//  MealsComposer.swift
//  BitHealthProject
//
//  Created by Ahmad Zaky W on 05/10/23.
//

import UIKit

public final class MealsComposer {
    public static func composeMeals(
        httpClient: HTTPClient,
        routeHandler: @escaping (MealsRoute) -> Void
    ) -> MealsViewController {
        let interactor = MealsInteractor(httpClient: httpClient)
        let viewModel = MealsViewModelDefault(interactor: interactor, routeHandler: routeHandler)
        let vc = MealsViewController(viewModel: viewModel)
        return vc
    }
}
