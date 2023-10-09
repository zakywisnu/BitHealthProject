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
    
    private lazy var loadingView: UIView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = .red
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.startAnimating()
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        view.addSubview(activityIndicator)
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            activityIndicator.widthAnchor.constraint(equalToConstant: 24),
            activityIndicator.heightAnchor.constraint(equalToConstant: 24),
        ])
        view.isHidden = true
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
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "door.right.hand.open"), style: .plain, target: self, action: #selector(didTapLogout))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Change Meals", style: .plain, target: self, action: #selector(didTapChange))
    }
    
}

extension MealsViewController {
    private func setupView() {
        view.addSubview(tableView)
        view.addSubview(loadingView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            loadingView.topAnchor.constraint(equalTo: view.topAnchor),
            loadingView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            loadingView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            loadingView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    private func observeViewModel() {
        viewModel.mealsPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                guard let self = self else { return }
                self.tableView.reloadData()
            }.store(in: &cancellables)
        
        viewModel.isLoading
            .receive(on: DispatchQueue.main)
            .sink { [weak self] isLoading in
                guard let self = self else { return }
                self.loadingView.isHidden = !isLoading
            }.store(in: &cancellables)
    }
    
    @objc
    private func didTapLogout() {
        let ac = UIAlertController(title: "Sign out", message: "Do you want to sign out?", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) { [weak ac] action in
            ac?.dismiss(animated: true)
        }
        
        let submitAction = UIAlertAction(title: "Sign out", style: .destructive) { [weak self, weak ac] action in
            ac?.dismiss(animated: true)
            self?.viewModel.navigate(to: .logout)
        }
        
        ac.addAction(cancelAction)
        ac.addAction(submitAction)
        present(ac, animated: true)
    }
    
    @objc
    private func didTapChange() {
        let ac = UIAlertController(title: "Enter meals first letter", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        let submitAction = UIAlertAction(title: "Submit", style: .default) { [weak self, weak ac] action in
            guard let self = self, let letter = ac?.textFields?[0].text else { return }
            ac?.dismiss(animated: true)
            self.viewModel.changeMeals(letter: String(letter.first ?? Character("a")))
        }
        
        ac.addAction(submitAction)
        present(ac, animated: true)
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
                self.viewModel.navigate(to: .image(data.strMealThumb))
            }
            .onTapDetail { [weak self] in
                guard let self = self else { return }
                self.viewModel.navigate(to: .details(data.idMeal))
            }
        
        return cell
    }
}
