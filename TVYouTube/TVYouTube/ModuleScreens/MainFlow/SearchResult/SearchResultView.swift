//
//  SearchResultView.swift
//  TVYouTube
//
//  Created Nikita Omelchenko on 19.12.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import SnapKit
import SkeletonView

private typealias Module = SearchResultModule
private typealias View = Module.View

extension Module {
    final class View: UIView, Module.ViewOutput {
        // MARK: - UI Elements
        private(set) lazy var contentTableView: UITableView = build(.init(frame: .zero, style: .plain)) {
            $0.separatorStyle = .none
            $0.register(SearchResultTableViewCell.self)
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
        addSubview(contentTableView)

        makeConstraints()
    }

    private func makeConstraints() {
        contentTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
