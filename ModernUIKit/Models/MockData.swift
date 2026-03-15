//
//  MockData.swift
//  ModernUIKit
//
//  Created by Acoman on 15.03.2026.
//

import UIKit

struct Banner: Hashable {
    let id: Int
    let color: UIColor
}

struct Category: Hashable {
    let id: Int
    let name: String
}

struct Product: Hashable {
    let id: String
    let name: String
    let price: Double
}

struct MockData {
    static let banners: [Banner] = [
        Banner(id: 1, color: UIColor(red: 0.91, green: 0.13, blue: 0.13, alpha: 1)),
        Banner(id: 2, color: UIColor(red: 0.13, green: 0.45, blue: 0.91, alpha: 1)),
        Banner(id: 3, color: UIColor(red: 0.13, green: 0.75, blue: 0.40, alpha: 1)),
        Banner(id: 4, color: UIColor(red: 0.91, green: 0.55, blue: 0.13, alpha: 1)),
        Banner(id: 5, color: UIColor(red: 0.60, green: 0.13, blue: 0.91, alpha: 1)),
    ]

    static let categories: [Category] = [
        Category(id: 1, name: "Electronics"),
        Category(id: 2, name: "Fashion"),
        Category(id: 3, name: "Sports"),
        Category(id: 4, name: "Home & Garden"),
        Category(id: 5, name: "Books"),
        Category(id: 6, name: "Toys"),
        Category(id: 7, name: "Automotive"),
        Category(id: 8, name: "Beauty"),
    ]

    static let products: [Product] = [
        Product(id: "p1", name: "iPhone 15 Pro", price: 1299.99),
        Product(id: "p2", name: "Nike Air Max", price: 129.99),
        Product(id: "p3", name: "Samsung 4K TV", price: 799.99),
        Product(id: "p4", name: "Levi's Jeans", price: 59.99),
        Product(id: "p5", name: "MacBook Air", price: 1099.99),
        Product(id: "p6", name: "Yoga Mat", price: 29.99),
        Product(id: "p7", name: "Coffee Maker", price: 49.99),
        Product(id: "p8", name: "Harry Potter Box Set", price: 39.99),
        Product(id: "p9", name: "AirPods Pro", price: 249.99),
        Product(id: "p10", name: "Adidas Hoodie", price: 79.99),
        Product(id: "p11", name: "LG Monitor", price: 349.99),
        Product(id: "p12", name: "Running Shorts", price: 24.99),
        Product(id: "p13", name: "Instant Pot", price: 89.99),
        Product(id: "p14", name: "LEGO Technic", price: 69.99),
        Product(id: "p15", name: "Car Phone Mount", price: 19.99),
        Product(id: "p16", name: "Face Moisturizer", price: 34.99),
        Product(id: "p17", name: "iPad Mini", price: 499.99),
        Product(id: "p18", name: "Puma Sneakers", price: 89.99),
        Product(id: "p19", name: "Desk Lamp", price: 44.99),
        Product(id: "p20", name: "The Great Gatsby", price: 12.99),
    ]
}
