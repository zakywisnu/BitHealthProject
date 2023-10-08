//
//  MealsCell.swift
//  BitHealthProject
//
//  Created by Ahmad Zaky W on 05/10/23.
//

import UIKit
import SDWebImage

final class MealsCell: UITableViewCell {
    
    private let containerView: UIView = {
        let view = UIView()
        view.setCornerRadius(8)
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var mealImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var contentContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let titleLabel: UILabel = {
        let view = UILabel()
        view.setLabel(font: .systemFont(ofSize: 14, weight: .bold))
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let categoryLabel: UILabel = {
        let view = UILabel()
        view.setLabel(font: .systemFont(ofSize: 14, weight: .regular))
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("coder hasn't been implemented yet")
    }
    
    func setupData(image: String, title: String, category: String) {
        if let imageURL = URL(string: image) {
            mealImage.sd_setImage(with: imageURL)
        }
        titleLabel.text = title
        categoryLabel.text = category
    }
}

extension MealsCell {
    private func setupView() {
        selectionStyle = .none
        
        contentView.addSubview(containerView)
        [mealImage, contentContainer].forEach { containerView.addSubview($0) }
        [titleLabel, categoryLabel].forEach { contentContainer.addSubview($0) }
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            mealImage.topAnchor.constraint(equalTo: containerView.topAnchor),
            mealImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            mealImage.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            mealImage.heightAnchor.constraint(equalToConstant: 75),
            
            contentContainer.topAnchor.constraint(equalTo: mealImage.bottomAnchor),
            contentContainer.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            contentContainer.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            contentContainer.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: contentContainer.topAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: contentContainer.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentContainer.trailingAnchor, constant: -16),
            
            categoryLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            categoryLabel.leadingAnchor.constraint(equalTo: contentContainer.leadingAnchor, constant: 16),
            categoryLabel.trailingAnchor.constraint(equalTo: contentContainer.trailingAnchor, constant: -16),
            categoryLabel.bottomAnchor.constraint(equalTo: contentContainer.bottomAnchor, constant: -8),
        ])
    }
}
