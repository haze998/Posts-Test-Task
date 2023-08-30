//
//  HomeTableViewCell.swift
//  PostsTestApp
//
//  Created by Evgeniy Docenko on 30.08.2023.
//

import UIKit
import SnapKit

class HomeTableViewCell: UITableViewCell {
    // MARK: - Views
    private lazy var postTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontNames.sfBold.rawValue, size: 20)
        label.textColor = .black
        return label
    }()
    
    private lazy var postText: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontNames.sfRegular.rawValue, size: 18)
        label.textColor = .gray
        label.numberOfLines = 5
        return label
    }()
    
    private lazy var likeImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: ImageNames.like.rawValue))
        return image
    }()
    
    private lazy var likesCounter: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontNames.sfLight.rawValue, size: 16)
        label.textColor = .gray
        return label
    }()
    
    private lazy var postDate: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontNames.sfLight.rawValue, size: 16)
        label.textColor = .gray
        return label
    }()
    
    private lazy var postButton: UIButton = {
        let button = UIButton()
        button.setTitle("Press me", for: .normal)
        button.backgroundColor = .systemIndigo
        return button
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupUI()
        setupLayout()
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        // spacing between cells
        self.contentView.frame = self.contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 18, right: 0))
        self.postButton.layer.cornerRadius = 10
    }
    
    // MARK: - Configure cell
    func configureCell(_ post: PostInfo) {
        postTitle.text = post.title
        postText.text = post.previewText
        likeImage.image = UIImage(named: ImageNames.like.rawValue)
        likesCounter.text = "\(post.likesCount ?? 0)"
        postDate.text = "\(post.timeshamp?.convertTimestampToDate(timestamp: Double(post.timeshamp ?? 0)) ?? "")"
    }
    
    // MARK: - Setup Layout
    private func setupLayout() {
        contentView.addSubviews(view: [postTitle, postText, likeImage, likesCounter, postDate, postButton])
        
        postTitle.snp.makeConstraints { make in
            make.top.equalTo(8)
            make.left.equalTo(16)
            make.right.equalTo(contentView).inset(16)
        }
        
        postText.snp.makeConstraints { make in
            make.top.equalTo(postTitle.snp.bottom).offset(8)
            make.left.equalTo(16)
            make.right.equalTo(contentView).inset(16)
        }

        likeImage.snp.makeConstraints { make in
            make.width.height.equalTo(25)
            make.top.equalTo(postText.snp.bottom).offset(8)
            make.left.equalTo(16)
        }

        likesCounter.snp.makeConstraints { make in
            make.centerY.equalTo(likeImage)
            make.left.equalTo(likeImage.snp.right).offset(8)
            make.width.equalTo(100)
        }

        postDate.snp.makeConstraints { make in
            make.centerY.equalTo(likeImage)
            make.right.equalTo(contentView).inset(16)
        }

        postButton.snp.makeConstraints { make in
            make.top.equalTo(postDate.snp.bottom).offset(16)
            make.leading.trailing.equalTo(contentView).inset(16)
            make.height.equalTo(50)
        }
    }
}
