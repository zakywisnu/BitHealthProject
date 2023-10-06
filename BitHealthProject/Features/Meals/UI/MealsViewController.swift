//
//  MealsViewController.swift
//  BitHealthProject
//
//  Created by Ahmad Zaky W on 05/10/23.
//

import UIKit

public final class MealsViewController: UIViewController {
    
    private let viewModel: MealsViewModel
    
    public init(viewModel: MealsViewModel){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    public required init?(coder: NSCoder) {
        fatalError("coder hasn't been implemented yet")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.loadMeals()
    }
    
}

extension MealsViewController {
    private func setupView() {
        
    }
}
