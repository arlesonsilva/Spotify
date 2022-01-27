//
//  FeaturedPlaylistCollectionViewCell.swift
//  Spotify
//
//  Created by Arleson Silva on 23/01/22.
//

import UIKit

class FeaturedPlaylistCollectionViewCell: UICollectionViewCell {
    static let identifier = "FeaturedPlaylistCollectionViewCell"

    private let playlistImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "photo")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 4
        return imageView
    }()

    private let playlistNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    private let creatorNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .light)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubview(playlistImageView)
        contentView.addSubview(playlistNameLabel)
        contentView.addSubview(creatorNameLabel)
        contentView.clipsToBounds = true
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        let imageSize = contentView.height - 70
        playlistImageView.frame = CGRect(x: (contentView.width - imageSize) / 2,
                                         y: 3,
                                         width: imageSize,
                                         height: imageSize)

        creatorNameLabel.frame = CGRect(x: 3,
                                        y: contentView.height - 30,
                                        width: contentView.width - 6,
                                        height: 30)

        playlistNameLabel.frame = CGRect(x: 3,
                                         y: contentView.height - 60,
                                         width: contentView.width - 6,
                                         height: 30)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        playlistImageView.image = nil
        playlistNameLabel.text = nil
        creatorNameLabel.text = nil
    }

    func configure(with viewModel: FeaturedPlaylistCellViewModel) {
        playlistImageView.sd_setImage(with: viewModel.artworkURL, completed: nil)
        playlistNameLabel.text = viewModel.name
        creatorNameLabel.text = viewModel.creatorName
    }
}
