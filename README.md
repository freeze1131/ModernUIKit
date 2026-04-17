# ModernUIKit 🛍️

A UIKit iOS app demonstrating modern collection view patterns using `UICollectionViewCompositionalLayout` and `UICollectionViewDiffableDataSource`. Built to replicate the kind of multi-section home feed found in large-scale e-commerce apps like Trendyol and Hepsiburada.

## Screenshots

| Home Feed | Products |
|-----------|----------|
| ![Home](screenshots/home.png) | ![Products](screenshots/products.png) |

## What This Project Demonstrates

### UICollectionViewCompositionalLayout
The core of the project. One `UICollectionView` with three completely different section layouts — something impossible with the legacy `UICollectionViewFlowLayout`.

- **Banner section** — full-width items with horizontal paging (`.orthogonalScrollingBehavior = .paging`), mimicking a promotional carousel
- **Categories section** — estimated-width pill items with continuous horizontal scrolling, each sized to fit its content
- **Products section** — 2-column grid with card-style cells and content insets

Each section is defined independently inside the compositional layout closure:
```swift
UICollectionViewCompositionalLayout { sectionIndex, environment in
    switch sectionIndex {
    case 0: return bannersLayout()
    case 1: return categoriesLayout()
    case 2: return productsLayout()
    }
}
```

### UICollectionViewDiffableDataSource
Replaces the old `UICollectionViewDataSource` protocol entirely. No more `numberOfItemsInSection` or manual `insertItems`/`deleteItems` calls.

- Type-safe section and item identification via `Hashable` enums
- `NSDiffableDataSourceSnapshot` for applying data — the data source calculates the diff and animates changes automatically
- `supplementaryViewProvider` for section headers

```swift
enum Section: Hashable, Sendable { case banners, categories, products }
enum Item: Hashable, Sendable {
    case banner(Banner)
    case category(Category)
    case product(Product)
}
```

### Custom UICollectionViewCell Subclasses
Three dedicated cell classes built entirely in code — no storyboards, no XIBs:

- `BannerCell` — colored background with centered campaign label
- `CategoryCell` — pill-shaped with dynamic width, `estimated()` layout dimension
- `ProductCell` — card style with shadow, name and price labels with Auto Layout constraints

### UICollectionReusableView for Section Headers
`SectionHeader` subclass registered with `elementKindSectionHeader`, provided via `supplementaryViewProvider` — the modern replacement for delegate-based header configuration.

### Programmatic UIKit Setup
Zero storyboard usage. Full programmatic setup:
- `SceneDelegate` manually creates `UIWindow`, `UINavigationController`, and root `ViewController`
- All constraints set with `NSLayoutConstraint.activate`
- `translatesAutoresizingMaskIntoConstraints = false` on every programmatic view

## Why Compositional Layout Over FlowLayout

`UICollectionViewFlowLayout` applies one layout to the entire collection view. To achieve mixed layouts (carousel + pills + grid) with FlowLayout, you'd need:
- Multiple nested `UICollectionView` instances
- Multiple data sources and delegates
- Manual size calculations and layout conflicts

Compositional layout solves this with a single collection view, a single data source, and per-section layout definitions.

## Project Structure

```
ModernUIKit/
├── Models/
│   └── MockData.swift          # Banner, Category, Product structs + mock data
├── Views/
│   ├── BannerCell.swift
│   ├── CategoryCell.swift
│   ├── ProductCell.swift
│   └── SectionHeader.swift
└── ViewController.swift        # Layout, data source, snapshot
```

## Technical Stack

- **Language:** Swift 5.9+
- **UI Framework:** UIKit (fully programmatic)
- **Minimum iOS:** iOS 16+
- **Layout:** UICollectionViewCompositionalLayout
- **Data Source:** UICollectionViewDiffableDataSource
- **Architecture:** MVC
