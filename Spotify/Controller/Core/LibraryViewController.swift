//
//  LibraryViewController.swift
//  Spotify
//
//  Created by Arleson Silva on 17/01/22.
//

import UIKit

class LibraryViewController: UIViewController {

    weak var delegate: LibraryToggleViewDelegate?
    private let playlistVC = LibraryPlaylistViewController()
    private let albumsVC = LibraryAlbumsViewController()
    
    private lazy var toggleView: LibraryToggleView = {
        let toggle = LibraryToggleView()
        toggle.delegate = self
        return toggle
    }()

    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.isPagingEnabled = true
        scroll.delegate = self
        scroll.backgroundColor = .systemBackground
        scroll.contentSize = CGSize(width: view.width * 2, height: scroll.height)
        return scroll
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(toggleView)
        view.addSubview(scrollView)
        addChildren()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = CGRect(
            x: 0,
            y: view.safeAreaInsets.top + 55,
            width: view.width,
            height: view.height - view.safeAreaInsets.top - view.safeAreaInsets.bottom - 55
        )
        toggleView.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: 200, height: 55)
    }

    private func addChildren() {
        addChild(playlistVC)
        scrollView.addSubview(playlistVC.view)
        playlistVC.view.frame = CGRect(
            x: 0,
            y: 0,
            width: scrollView.width,
            height: scrollView.height
        )
        playlistVC.didMove(toParent: self)

        addChild(albumsVC)
        scrollView.addSubview(albumsVC.view)
        albumsVC.view.frame = CGRect(
            x: view.width,
            y: 0,
            width: scrollView.width,
            height: scrollView.height
        )
        albumsVC.didMove(toParent: self)
    }

}

extension LibraryViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.x >= (view.width - 100) {
            toggleView.update(for: .album)
        }else {
            toggleView.update(for: .playlist)
        }
    }
}

extension LibraryViewController: LibraryToggleViewDelegate {
    func didTapPlaylistsButton(_ toggleView: LibraryToggleView) {
        scrollView.setContentOffset(.zero, animated: true)
    }

    func didTapAlbumsButton(_ toggleView: LibraryToggleView) {
        scrollView.setContentOffset(CGPoint(x: view.width, y: 0), animated: true)
    }
}
