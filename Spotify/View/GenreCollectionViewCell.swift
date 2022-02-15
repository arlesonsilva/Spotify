//
//  GenreCollectionViewCell.swift
//  Spotify
//
//  Created by Arleson Silva on 15/02/22.
//

import UIKit

class GenreCollectionViewCell: UICollectionViewCell {
    static let identifier = "GenreCollectionViewCell"
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.tintColor = .white
        image.image = UIImage(systemName: "music.quarternote.3",
                              withConfiguration: UIImage.SymbolConfiguration(pointSize: 50,
                                                                             weight: .regular))
        return image
    }()

    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        return label
    }()

    private let colors: [UIColor] = [
        .systemPink,
        .systemBlue,
        .systemPurple,
        .systemOrange,
        .systemGreen,
        .systemRed,
        .systemYellow,
        .darkGray,
        .systemTeal
    ]

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.layer.cornerRadius = 8
        contentView.layer.masksToBounds = true
        contentView.addSubview(label)
        contentView.addSubview(imageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = CGRect(x: 10,
                             y: contentView.height / 2,
                             width: contentView.width - 20,
                             height: contentView.height / 2)

        imageView.frame = CGRect(x: contentView.width / 2,
                                 y: 0,
                                 width: contentView.width / 2,
                                 height: contentView.height / 2)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        label.text = nil
    }
    
    func configure(with title: String) {
        label.text = title
        contentView.backgroundColor = colors.randomElement()
    }
}
