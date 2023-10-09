//
//  DetailMealsComposer.swift
//  BitHealthProject
//
//  Created by Ahmad Zaky W on 08/10/23.
//

import Foundation

public final class DetailMealsComposer {
    public static func composeDetails(
        httpClient: HTTPClient,
        id: String,
        routeFullscreen: @escaping (String) -> Void
    ) -> DetailMealsViewController {
        let interactor = DetailMealsInteractor(httpClient: httpClient)
        let viewModel = DetailMealsViewModelDefault(id: id, interactor: interactor, routeFullscreen: routeFullscreen)
        let vc = DetailMealsViewController(viewModel: viewModel)
        return vc
    }
}

