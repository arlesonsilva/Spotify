//
//  SearchResultDefaultTableViewCell.swift
//  Spotify
//
//  Created by Arleson Silva on 15/03/22.
//

import UIKit
import SDWebImage

class SearchResultDefaultTableViewCell: UITableViewCell {

    static let identifier = "SearchResultDefaultTableViewCell"

    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        return label
    }()

    private let icon: UIImageView = {
        let icon = UIImageView()
        icon.contentMode = .scaleAspectFill
        return icon
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        contentView.addSubview(icon)
        contentView.clipsToBounds = true
        accessoryType = .disclosureIndicator
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        let imageSize: CGFloat = contentView.height - 10
        icon.frame = CGRect(x: 10,
                            y: 5,
                            width: imageSize,
                            height: imageSize)
        icon.layer.cornerRadius = imageSize / 2
        icon.layer.masksToBounds = true
        label.frame = CGRect(x: icon.right + 10, y: 0, width: contentView.width - icon.right - 15, height: contentView.height)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        label.text = nil
        icon.image = nil
    }

    func configure(with viewModel: SearchResultDefaultTableViewCellViewModel) {
        label.text = viewModel.title
        icon.sd_setImage(with: viewModel.imageURL, completed: nil)
    }
}
