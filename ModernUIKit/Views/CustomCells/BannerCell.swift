//
//  BannerCell.swift
//  ModernUIKit
//
//  Created by Acoman on 17.04.2026.
//

import UIKit

class BannerCell: UICollectionViewCell {
    
    let titleLabel = UILabel()
    
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
 private func setupUI(){
        titleLabel.font = .preferredFont(forTextStyle: .title2)
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
            
    }
    
    func configure(with banner: Banner) {
        titleLabel.text = "Campaign \(banner.id)"
        contentView.backgroundColor = banner.color
    }
    
}
