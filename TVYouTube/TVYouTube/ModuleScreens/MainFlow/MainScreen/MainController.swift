//
//  MainController.swift
//
//  Created Nikita Omelchenko
//

import UIKit

private typealias Module = MainModule
private typealias Controller = Module.Controller

extension Module {
    final class Controller: UIViewController, BaseController {
        // MARK: - Dependencies
        var output: ControllerOutput?
        var viewOutput: ViewOutput?

        var searchResultViewController: UIViewController?

        // MARK: - Properties
        private lazy var searchController: UISearchController = build(
            .init(searchResultsController: searchResultViewController)
        ) {
            $0.searchResultsUpdater = searchResultViewController as? UISearchResultsUpdating
        }

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
        }

        override func viewDidDisappear(_ animated: Bool) {
            super.viewDidDisappear(animated)

            output?.didDisappear()
        }
    }
}

private extension Controller {
    private func commonSetup() {
        title = AppLocale.Main.title

        navigationCommonSetup()
        setTableViewDelegate()
    }

    private func navigationCommonSetup() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = searchController
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
            self?.viewOutput?.contentTableView.reloadData()
        }
    }
}

extension Controller: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        output?.dataSource[section].titile
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        output?.dataSource.count ?? 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        output?.dataSource[section].numberOfCells ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        .init()
    }
}
