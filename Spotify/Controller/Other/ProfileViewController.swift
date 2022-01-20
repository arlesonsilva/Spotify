//
//  ProfileViewController.swift
//  Spotify
//
//  Created by Arleson Silva on 17/01/22.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        view.backgroundColor = .systemBackground

        APICaller.shared.getCurrentUserProfile { result in
            switch result {
            case .success(let model):
                break
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

}
