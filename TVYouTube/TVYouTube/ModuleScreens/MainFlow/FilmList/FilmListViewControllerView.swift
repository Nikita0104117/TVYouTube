//
//  FilmListViewControllerView.swift
//  TVYouTube
//
//  Created Nikita Omelchenko on 20.12.2022.
//

import UIKit
import SnapKit
import SkeletonView

private typealias Module = FilmListViewControllerModule
private typealias View = Module.View

extension Module {
    final class View: UIView, Module.ViewOutput {
        private lazy var collectionLayout: UICollectionViewFlowLayout = build {
            $0.scrollDirection = .horizontal
            $0.minimumLineSpacing = 5
            $0.minimumInteritemSpacing = 5
        }

        private(set) lazy var contentCollectionView: UICollectionView = build(
            .init(
                frame: .zero,
                collectionViewLayout: collectionLayout
            )
        ) {
            $0.register(FilmListCollectionViewCell.self)
            $0.isSkeletonable = true
        }

        // MARK: - Init
        init() {
            super.init(frame: .zero)

            commonSetup()
        }

        required init?(coder: NSCoder) { super.init(coder: coder) }
    }
}

private extension View {
    private func commonSetup() {
        addSubview(contentCollectionView)

        makeConstraints()
    }

    private func makeConstraints() {
        contentCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
