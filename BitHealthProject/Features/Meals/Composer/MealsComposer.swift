//
//  MealsComposer.swift
//  BitHealthProject
//
//  Created by Ahmad Zaky W on 05/10/23.
//

import Foundation

public final class MealsComposer {
    public static func composeMeals(httpClient: HTTPClient) -> MealsViewController {
        let viewModel = MealsViewModelDefault(httpClient: httpClient)
        let vc = MealsViewController(viewModel: viewModel)
        return vc
    }
}
