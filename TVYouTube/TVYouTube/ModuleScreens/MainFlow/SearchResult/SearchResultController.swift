//
//  SearchResultController.swift
//  TVYouTube
//
//  Created Nikita Omelchenko on 19.12.2022.
//

import UIKit
import SkeletonView

private typealias Module = SearchResultModule
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
            viewOutput?.contentTableView.showSkeleton(usingColor: AppColors.gray.color)
        }

        override func viewDidDisappear(_ animated: Bool) {
            super.viewDidDisappear(animated)

            output?.didDisappear()
        }
    }
}

private extension Controller {
    private func commonSetup() {
        setTableViewDelegate()
    }

    // MARK: - Setup Delegates
    private func setTableViewDelegate() {
        viewOutput?.contentTableView.delegate = self
        viewOutput?.contentTableView.dataSource = self
    }
}

extension Controller: Module.ControllerInput {
    func reloadData() {
        DispatchQueue.main.async { [weak self] in
            self?.viewOutput?.contentTableView.hideSkeleton()
            self?.viewOutput?.contentTableView.reloadData()
        }
    }
}

extension Controller: UITableViewDataSource, SkeletonTableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        output?.dataSource.count ?? 0
    }

    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        SearchResultTableViewCell.reusebleId
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: SearchResultTableViewCell.reusebleId, for: indexPath) as? SearchResultTableViewCell,
            let product: ObjectEntity = output?.dataSource[safe: indexPath.item]
        else { return .init() }

        cell.conifgCell(with: product)

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let product: ObjectEntity = output?.dataSource[safe: indexPath.item] else { return }

        output?.didSelect(product)
    }
}

extension Controller: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else { return }

        output?.searchProduct(searchText)
    }
}
