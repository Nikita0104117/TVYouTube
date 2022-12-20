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

        // MARK: - Search Result View Controller
        var searchResultViewController: UIViewController?

        // MARK: - View Controllers
        var filmViewCollectionViewController: UIViewController?
        var actorViewCollectionViewController: UIViewController?
        var filmListCollectionViewController: UIViewController?

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
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
            case Module.Sections.one.rawValue:
                return Module.Sections.hieght
            case Module.Sections.two.rawValue:
                return Module.Sections.hieght
            case Module.Sections.three.rawValue:
                return Module.Sections.hieght
            default:
                return Module.Sections.hieght
        }
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
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.reusebleId, for: indexPath) as? MainTableViewCell
        else { return .init() }

        switch indexPath.section {
            case Module.Sections.one.rawValue:
                cell.conifgCell(with: filmViewCollectionViewController?.view)
            case Module.Sections.two.rawValue:
                cell.conifgCell(with: actorViewCollectionViewController?.view)
            case Module.Sections.three.rawValue:
                cell.conifgCell(with: filmListCollectionViewController?.view)
            default:
                break
        }

        return cell
    }
}
