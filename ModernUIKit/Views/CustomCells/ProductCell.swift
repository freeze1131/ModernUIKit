//
//  BannerCell.swift
//  ModernUIKit
//
//  Created by Acoman on 15.03.2026.
//

import UIKit

class ProductCell: UICollectionViewCell {
    let nameLabel = UILabel()
    let priceLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupUI(){
        contentView.addSubview(nameLabel)
        contentView.addSubview(priceLabel)
        
        nameLabel.font = .preferredFont(forTextStyle: .headline)
        nameLabel.textColor = .label
        
        priceLabel.font = .preferredFont(forTextStyle: .caption1)
        priceLabel.textColor = .secondaryLabel
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            nameLabel.bottomAnchor.constraint(equalTo: priceLabel.topAnchor),
            
            priceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            priceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
        ])
    }
    
    func configure(with product: Product) {
        nameLabel.text = product.name
        priceLabel.text = "$\(product.price)"
    }

    
}



