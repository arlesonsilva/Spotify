//
//  TabBarViewController.swift
//  Spotify
//
//  Created by Arleson Silva on 17/01/22.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let homeViewController = HomeViewController()
        let searchViewController = SearchViewController()
        let libraryViewController = LibraryViewController()

        homeViewController.title = "Browse"
        searchViewController.title = "Search"
        libraryViewController.title = "Library"

        homeViewController.navigationItem.largeTitleDisplayMode = .always
        searchViewController.navigationItem.largeTitleDisplayMode = .always
        libraryViewController.navigationItem.largeTitleDisplayMode = .always

        let navigationHome = UINavigationController(rootViewController: homeViewController)
        let navigationSearch = UINavigationController(rootViewController: searchViewController)
        let navigationLibrary = UINavigationController(rootViewController: libraryViewController)

        navigationHome.navigationBar.tintColor = .label
        navigationSearch.navigationBar.tintColor = .label
        navigationLibrary.navigationBar.tintColor = .label
        
        navigationHome.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 1)
        navigationSearch.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 1)
        navigationLibrary.tabBarItem = UITabBarItem(title: "Library", image: UIImage(systemName: "music.note.list"), tag: 1)
        
        navigationHome.navigationBar.prefersLargeTitles = true
        navigationSearch.navigationBar.prefersLargeTitles = true
        navigationLibrary.navigationBar.prefersLargeTitles = true

        setViewControllers([navigationHome, navigationSearch, navigationLibrary], animated: true)
    }

}
