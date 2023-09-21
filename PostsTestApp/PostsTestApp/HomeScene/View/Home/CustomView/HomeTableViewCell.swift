//
//  HomeTableViewCell.swift
//  PostsTestApp
//
//  Created by Evgeniy Docenko on 30.08.2023.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    // MARK: - Properties
    var buttonTapСlosure: (()->())?
    
    // MARK: - Views
    private lazy var postView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var newsTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont(name: FontNames.sfBold.rawValue, size: 20)
        label.textAlignment = .left
        return label
    }()
    
    lazy var previewLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: FontNames.sfRegular.rawValue, size: 18)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var likesImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: ImageNames.heart.rawValue))
        imageView.tintColor = .red
        imageView.contentMode = .scaleAspectFit
        imageView.frame = .init(x: 0, y: 0, width: 20, height: 20)
        return imageView
    }()
    
    private lazy var likesCountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: FontNames.sfLight.rawValue, size: 16)
        label.textAlignment = .left
        label.textColor = .darkGray
        return label
    }()
    
    private lazy var likesStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [likesImageView, likesCountLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 4
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillProportionally
        return stack
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: FontNames.sfLight.rawValue, size: 16)
        label.textAlignment = .right
        label.textColor = .darkGray
        return label
    }()
    
    private lazy var expandButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Expand", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: FontNames.sfRegular.rawValue, size: 20)
        button.backgroundColor = .systemIndigo
        button.layer.cornerRadius = 8
        return button
    }()
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupUI()
        setupConstraints()
    }
    
    // MARK: - Setup UI
    func setupUI() {
        expandButton.addTarget(self, action: #selector(buttonDidTap(_:)), for: .touchUpInside)
        self.selectionStyle = .none
    }
    
    // MARK: - Selectors
    @objc func buttonDidTap(_ sender: UIButton!) {
        buttonTapСlosure?()
    }
    
    // MARK: - Configure
    func configureButton(with buttonTitle: String) {
        expandButton.setTitle(buttonTitle, for: .normal)
    }
    
    func configure(with post: PostInfo) {
        newsTitleLabel.text = post.title
        previewLabel.text = post.previewText
        likesCountLabel.text = "\(post.likesCount ?? 0)"
        dateLabel.text = "\(post.timeshamp.convertToDays())" + " " + ConstNames.daysAgo.rawValue
    }
    
    //MARK: - Setup Layout
    func setupConstraints() {
            addSubview(postView)
            postView.snp.makeConstraints { make in
                make.top.equalToSuperview()
                make.leading.equalToSuperview().offset(8)
                make.trailing.equalToSuperview().offset(-8)
                make.bottom.equalToSuperview().offset(-12)
            }
            
            postView.addSubviews(view: [newsTitleLabel, previewLabel, likesStackView, dateLabel, expandButton])
            
            newsTitleLabel.snp.makeConstraints { make in
                make.top.equalTo(postView.snp.top).offset(8)
                make.leading.equalTo(postView.snp.leading).offset(15)
                make.trailing.equalTo(postView.snp.trailing).offset(-10)
                make.height.equalTo(70)
            }
            
            previewLabel.snp.makeConstraints { make in
                make.top.equalTo(newsTitleLabel.snp.bottom)
                make.leading.equalTo(postView.snp.leading).offset(15)
                make.trailing.equalTo(postView.snp.trailing).offset(-20)
            }
            
            likesStackView.snp.makeConstraints { make in
                make.top.equalTo(previewLabel.snp.bottom).offset(10)
                make.leading.equalTo(postView.snp.leading).offset(10)
                make.height.equalTo(20)
            }
            
            dateLabel.snp.makeConstraints { make in
                make.top.equalTo(previewLabel.snp.bottom).offset(10)
                make.trailing.equalTo(postView.snp.trailing).offset(-10)
                make.height.equalTo(20)
            }
            
            expandButton.snp.makeConstraints { make in
                make.top.equalTo(likesStackView.snp.bottom).offset(10)
                make.leading.equalTo(postView.snp.leading)
                make.trailing.equalTo(postView.snp.trailing)
                make.bottom.equalTo(postView.snp.bottom)
                make.height.equalTo(50)
            }
        }
//    func setupConstraints() {
//        addSubview(postView)
//        postView.addSubviews(view: [newsTitleLabel, previewLabel, likesStackView, dateLabel, expandButton])
//
//        postView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
//        postView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
//        postView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
//        postView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12).isActive = true
//
//        newsTitleLabel.topAnchor.constraint(equalTo: postView.topAnchor, constant: 8).isActive = true
//        newsTitleLabel.leadingAnchor.constraint(equalTo: postView.leadingAnchor, constant: 15).isActive = true
//        newsTitleLabel.trailingAnchor.constraint(equalTo: postView.trailingAnchor, constant: -10).isActive = true
//        newsTitleLabel.heightAnchor.constraint(equalToConstant: 70).isActive = true
//
//        previewLabel.topAnchor.constraint(equalTo: newsTitleLabel.bottomAnchor).isActive = true
//        previewLabel.leadingAnchor.constraint(equalTo: postView.leadingAnchor, constant: 15).isActive = true
//        previewLabel.trailingAnchor.constraint(equalTo: postView.trailingAnchor, constant: -20).isActive = true
//
//        likesStackView.topAnchor.constraint(equalTo: previewLabel.bottomAnchor, constant: 10).isActive = true
//        likesStackView.leadingAnchor.constraint(equalTo: postView.leadingAnchor, constant: 10).isActive = true
//        likesStackView.heightAnchor.constraint(equalToConstant: 20).isActive = true
//
//        dateLabel.topAnchor.constraint(equalTo: previewLabel.bottomAnchor, constant: 10).isActive = true
//        dateLabel.trailingAnchor.constraint(equalTo: postView.trailingAnchor, constant: -10).isActive = true
//        dateLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
//
//        expandButton.topAnchor.constraint(equalTo: likesStackView.bottomAnchor, constant: 10).isActive = true
//        expandButton.leadingAnchor.constraint(equalTo: postView.leadingAnchor, constant: 0).isActive = true
//        expandButton.trailingAnchor.constraint(equalTo: postView.trailingAnchor, constant: 0).isActive = true
//        expandButton.bottomAnchor.constraint(equalTo: postView.bottomAnchor, constant: 0).isActive = true
//        expandButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
//    }
}
