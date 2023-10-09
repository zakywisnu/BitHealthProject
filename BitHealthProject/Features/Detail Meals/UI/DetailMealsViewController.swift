//
//  DetailMealsViewController.swift
//  BitHealthProject
//
//  Created by Ahmad Zaky W on 08/10/23.
//

import UIKit
import Combine
import SDWebImage

public final class DetailMealsViewController: UIViewController {
    
    private let viewModel: DetailMealsViewModel
    private var cancellables: Set<AnyCancellable> = .init()
    
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var mealImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setCornerRadius(0)
        view.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapImage))
        view.addGestureRecognizer(tapGesture)
        return view
    }()
    
    private let ingredientsTitle: UILabel = {
        let view = UILabel()
        view.setLabel(font: .systemFont(ofSize: 16, weight: .bold), numberOfLines: 0)
        view.text = "Ingredients"
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        return view
    }()
    
    private let ingredientsStack: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let instructionTitle: UILabel = {
        let view = UILabel()
        view.setLabel(font: .systemFont(ofSize: 16, weight: .bold), numberOfLines: 0)
        view.text = "Instructions"
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        return view
    }()
    
    private let instructionView: UILabel = {
        let view = UILabel()
        view.setLabel(numberOfLines: 0)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public init(viewModel: DetailMealsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    public required init?(coder: NSCoder) {
        fatalError("coder hasn't been implemented yet")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        viewModel.loadDetails()
        observeViewModel()
    }
    
}

extension DetailMealsViewController {
    private func setupView() {
        view.backgroundColor = .white
        
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        
        [mealImage, ingredientsTitle, ingredientsStack, instructionTitle, instructionView].forEach { containerView.addSubview($0) }
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            mealImage.topAnchor.constraint(equalTo: containerView.topAnchor),
            mealImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            mealImage.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            mealImage.heightAnchor.constraint(equalToConstant: 200),
            
            ingredientsTitle.topAnchor.constraint(equalTo: mealImage.bottomAnchor, constant: 16),
            ingredientsTitle.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            ingredientsTitle.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            
            ingredientsStack.topAnchor.constraint(equalTo: ingredientsTitle.bottomAnchor, constant: 16),
            ingredientsStack.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            ingredientsStack.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            
            instructionTitle.topAnchor.constraint(equalTo: ingredientsStack.bottomAnchor, constant: 16),
            instructionTitle.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            instructionTitle.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            
            instructionView.topAnchor.constraint(equalTo: instructionTitle.bottomAnchor, constant: 16),
            instructionView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            instructionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            instructionView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16),
        ])
    }
    
    private func observeViewModel() {
        viewModel.detailPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] meals in
                guard let self = self, let meals = meals else { return }
                self.title = meals.strMeal
                if let imageURL = URL(string: meals.strMealThumb) {
                    self.mealImage.sd_setImage(with: imageURL)
                }
                self.instructionView.text = meals.strInstructions
                self.handleIngredients(meals.ingredients)
                self.ingredientsTitle.isHidden = false
                self.instructionTitle.isHidden = false
            }.store(in: &cancellables)
    }
    
    private func handleIngredients(_ ingredients: [String]) {
        ingredientsStack.arrangedSubviews.forEach { view in
            ingredientsStack.removeArrangedSubview(view)
        }
        
        ingredientsStack.subviews.forEach { view in
            view.removeFromSuperview()
        }
        
        guard !ingredients.isEmpty else { return }
        for ingredient in ingredients {
            let label = UILabel()
            label.setLabel(numberOfLines: 0)
            label.text = ingredient
            label.translatesAutoresizingMaskIntoConstraints = false
            ingredientsStack.addArrangedSubview(label)
        }
    }
    
    @objc
    private func didTapImage() {
        viewModel.navigate()
    }
}
