//
//  ViewController.swift
//  ModernUIKit
//
//  Created by Acoman on 15.03.2026.
//

import UIKit

nonisolated enum Section: Hashable, Sendable {
    case banners
    case categories
    case products
}

nonisolated enum Item: Hashable, Sendable {
    case banner(Banner)
    case product(Product)
    case category(Category)
}

class ViewController: UIViewController {
    let cv = UICollectionView(frame: .zero, collectionViewLayout: ViewController.createLayout())
    
    
    
    
    lazy var dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: cv) { collectionView, indexPath, item in
        switch item {
        case .banner(let banner):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
            cell.backgroundColor = banner.color
            return cell
        case .product(let product):
            guard let  cell: ProductCell = collectionView.dequeueReusableCell(withReuseIdentifier: "productCell", for: indexPath) as? ProductCell else {
                return UICollectionViewCell()
            }
            cell.configure(with: product)
            return cell
        case .category(let category):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as? CategoryCell else {
                return UICollectionViewCell()
            }
            cell.configure(with: category)
            return cell
        }
    }
    
    static func createLayout() -> UICollectionViewLayout {
        UICollectionViewCompositionalLayout { sectionIndex, environment in
            switch sectionIndex {
            case 0: // banners
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(100))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(100))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .paging
                item.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
                return section
            case 1: // categories
                let itemSize = NSCollectionLayoutSize(widthDimension: .estimated(100), heightDimension: .absolute(45))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 6, bottom: 4, trailing: 6)
                let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(100), heightDimension: .estimated(100))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.interGroupSpacing = 8
                return section
            case 2: // products
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .absolute(80))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 5, bottom: 8, trailing: 5)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(100))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                return section
            default:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(100))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(100))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                return section
            }
        }
    }
    
    private func applySnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.banners, .categories, .products])
        
        let items = MockData.banners.map(Item.banner)
        snapshot.appendItems(items, toSection: .banners)
        
        let categories = MockData.categories.map(Item.category)
        snapshot.appendItems(categories, toSection: .categories)
        
        let products = MockData.products.map(Item.product)
        snapshot.appendItems(products, toSection: .products)
        
        dataSource.apply(snapshot, animatingDifferences: false)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(cv)
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        cv.register(ProductCell.self, forCellWithReuseIdentifier: "productCell")
        cv.register(CategoryCell.self, forCellWithReuseIdentifier: "categoryCell")
        cv.translatesAutoresizingMaskIntoConstraints = false
        
       
        NSLayoutConstraint.activate([
            cv.topAnchor.constraint(equalTo: view.topAnchor),
            cv.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cv.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            cv.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        cv.dataSource = dataSource
        applySnapshot()
        self.view.backgroundColor = .red
    }
}
