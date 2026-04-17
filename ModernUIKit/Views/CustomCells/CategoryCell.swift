//
//  CategoryCell.swift
//  ModernUIKit
//
//  Created by Acoman on 15.03.2026.
//

import UIKit


class CategoryCell: UICollectionViewCell {
    
    let nameLabel =  UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupUI(){
        contentView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
        ])
        contentView.layer.cornerRadius = 14
        contentView.backgroundColor = .systemGray5
    }
    
 
    
    func configure(with category: Category) {
        nameLabel.text = category.name
    }
}
