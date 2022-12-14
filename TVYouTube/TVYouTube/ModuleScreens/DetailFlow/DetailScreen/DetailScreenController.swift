//
//  DetailScreenController.swift
//  TVYouTube
//
//  Created Nikita Omelchenko
//

import UIKit
import Kingfisher
import AVFoundation
import AVKit

private typealias Module = DetailScreenModule
private typealias Controller = Module.Controller

extension Module {
    final class Controller: UIViewController, BaseController {
        // MARK: - Dependencies
        var output: ControllerOutput?
        var viewOutput: ViewOutput?

        var object: ObjectEntity?

        // MARK: - Properties
        private lazy var playAction: UIAction = .init { [weak self] _ in
            self?.playVideo()
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
            commonConfig()
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
    private func commonConfig() {
        title = AppLocale.Detail.title

        guard
            let object = object,
            let viewOutput = viewOutput
        else { return }

        viewOutput.photoImageView.kf.setImage(with: URL(string: object.image))

        viewOutput.nameLabel.text = object.name
        viewOutput.typeLabel.text = object.type
        viewOutput.infoLabel.text = object.info

        viewOutput.playButton.addAction(playAction, for: .touchUpInside)
    }

    private func playVideo() {
            guard
                let path = Bundle.main.path(forResource: "test", ofType: "mp4")
        else { return }

            let player = AVPlayer(url: URL(fileURLWithPath: path))
            let playerController = AVPlayerViewController()

            playerController.player = player
            present(playerController, animated: true) {
                player.play()
            }
        }
}

extension Controller: Module.ControllerInput { }
