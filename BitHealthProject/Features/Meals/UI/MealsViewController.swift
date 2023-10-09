//
//  MealsViewController.swift
//  BitHealthProject
//
//  Created by Ahmad Zaky W on 05/10/23.
//

import UIKit
import Combine

public final class MealsViewController: UIViewController {
    
    private let viewModel: MealsViewModel
    private var cancellables: Set<AnyCancellable> = .init()
    
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.dataSource = self
        view.registerCell(ofType: MealsCell.self)
        view.separatorStyle = .none
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public init(viewModel: MealsViewModel){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    public required init?(coder: NSCoder) {
        fatalError("coder hasn't been implemented yet")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Meals"
        setupView()
        observeViewModel()
        viewModel.loadMeals()
    }
    
}

extension MealsViewController {
    private func setupView() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    private func observeViewModel() {
        viewModel.mealsPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                guard let self = self else { return }
                self.tableView.reloadData()
            }.store(in: &cancellables)
    }
}

extension MealsViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.meals.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MealsCell.identifier) as? MealsCell else { return UITableViewCell() }
        let data = viewModel.meals[indexPath.row]
        cell.setupData(image: data.strMealThumb, title: data.strMeal, category: data.strCategory)
            .onTapImage { [weak self] in
                guard let self = self else { return }
                
            }
            .onTapDetail { [weak self] in
                guard let self = self else { return }
                self.viewModel.routeDetail(id: data.idMeal)
            }
        
        return cell
    }
}
