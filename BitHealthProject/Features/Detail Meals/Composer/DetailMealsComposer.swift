//
//  DetailMealsComposer.swift
//  BitHealthProject
//
//  Created by Ahmad Zaky W on 08/10/23.
//

import Foundation

public final class DetailMealsComposer {
    public static func composeDetails(httpClient: HTTPClient, id: String) -> DetailMealsViewController {
        let viewModel = DetailMealsViewModelDefault(id: id, httpClient: httpClient)
        let vc = DetailMealsViewController(viewModel: viewModel)
        return vc
    }
}

