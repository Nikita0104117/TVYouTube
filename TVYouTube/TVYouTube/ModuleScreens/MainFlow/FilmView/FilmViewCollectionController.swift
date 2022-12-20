//
//  FilmViewCollectionController.swift
//  TVYouTube
//
//  Created Nikita Omelchenko on 20.12.2022.
//

import UIKit
import SkeletonView

private typealias Module = FilmViewCollectionModule
private typealias Controller = Module.Controller

extension Module {
    final class Controller: UIViewController, BaseController {
        // MARK: - Dependencies
        var output: ControllerOutput?
        var viewOutput: ViewOutput?

        // MARK: - Properties

        // MARK: - Init
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        init() { super.init(nibName: nil, bundle: nil) }

        // MARK: - Lifecycle
        override func loadView() {
            super.loadView()

            self.view = viewOutput?.view
        }

        override func viewDidLoad() {
            super.viewDidLoad()

            output?.didLoad()
            commonSetup()
        }

        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)

            output?.willAppear()
        }

        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)

            output?.didAppear()

            viewOutput?.contentCollectionView.showSkeleton(usingColor: AppColors.gray.color)
        }

        override func viewDidDisappear(_ animated: Bool) {
            super.viewDidDisappear(animated)

            output?.didDisappear()
        }
    }
}

private extension Controller {
    private func commonSetup() {
        setCollectionViewDelegate()
    }

    // MARK: - Setup Delegates
    private func setCollectionViewDelegate() {
        viewOutput?.contentCollectionView.delegate = self
        viewOutput?.contentCollectionView.dataSource = self
    }
}

extension Controller: Module.ControllerInput {
    func reloadData() {
        DispatchQueue.main.async { [weak self] in
            self?.viewOutput?.contentCollectionView.hideSkeleton()
            self?.viewOutput?.contentCollectionView.reloadData()
        }
    }
}

extension Controller: UICollectionViewDataSource, SkeletonCollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        output?.dataSource.count ?? 0
    }

    func collectionSkeletonView(_ skeletonView: UICollectionView, cellIdentifierForItemAt indexPath: IndexPath) -> ReusableCellIdentifier {
        FilmViewCollectionViewCell.reusebleId
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: FilmViewCollectionViewCell.reusebleId,
                for: indexPath
            ) as? FilmViewCollectionViewCell,
            let product: ObjectEntity = output?.dataSource[safe: indexPath.item]
        else {
            return .init()
        }

        cell.conifgCell(with: product)

        return cell
    }
}

extension Controller: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let product: ObjectEntity = output?.dataSource[safe: indexPath.item] else { return }

        output?.didSelect(product)
    }
}

extension Controller: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: (UIScreen.main.bounds.width * 0.7), height: 300)
    }
}
