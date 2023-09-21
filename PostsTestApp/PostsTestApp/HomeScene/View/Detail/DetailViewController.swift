//
//  DetailViewController.swift
//  PostsTestApp
//
//  Created by Evgeniy Docenko on 21.09.2023.
//

import UIKit
import SnapKit
import SDWebImage

class DetailViewController: UIViewController {
    
    var viewModel: DetailViewModel
    
    // MARK: - Private properties
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.alwaysBounceVertical = true
        scrollView.alwaysBounceHorizontal = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.insetsLayoutMarginsFromSafeArea = false
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .clear
        return contentView
    }()
    
    private lazy var postImage: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private lazy var postTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontNames.sfBold.rawValue, size: 24)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var postText: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontNames.sfRegular.rawValue, size: 18)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var likeImage: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: ImageNames.heart.rawValue))
        image.tintColor = .red
        return image
    }()
    
    private lazy var likeCounter: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontNames.sfLight.rawValue, size: 16)
        label.textColor = .darkGray
        return label
    }()
    
    private lazy var postDate: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontNames.sfLight.rawValue, size: 16)
        label.textColor = .darkGray
        return label
    }()
    
    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configurePost()
    }
    
    override func viewWillLayoutSubviews() {
        setupLayout()
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        self.navigationController?.navigationBar.tintColor = UIColor.red
        self.view.backgroundColor = .white
    }
    
    // MARK: - Configure
    private func configurePost() {
        viewModel.fetchDetailPost {
            self.postImage.sd_setImage(with: URL(string: self.viewModel.detailPost?.postImage ?? ""))
            self.postTitle.text = self.viewModel.detailPost?.title
            self.postText.text = self.viewModel.detailPost?.text
            self.likeCounter.text = "\(self.viewModel.detailPost?.likesCount ?? 0)"
            self.postDate.text = "\(self.viewModel.detailPost?.timeshamp ?? 0)"
            self.postDate.text = self.viewModel.detailPost?.timeshamp.convertTimeIntervalToFormattedDate(timeInterval: self.viewModel.detailPost?.timeshamp ?? 0)
        }
    }
    
    // MARK: - Setup Layout
    private func setupLayout() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(view: [postImage, postTitle, postText, likeImage, likeCounter, postDate])
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.top.equalTo(scrollView).offset(-100)
            make.bottom.equalTo(scrollView)
            make.left.right.equalTo(view)
            make.width.equalTo(scrollView)
            make.height.equalTo(1380)
            scrollView.isScrollEnabled = true
        }
        
        postImage.snp.makeConstraints { make in
            make.height.equalTo(350)
            make.width.equalToSuperview()
            make.top.equalTo(additionalSafeAreaInsets)
        }
        
        postTitle.snp.makeConstraints { make in
            make.top.equalTo(postImage.snp_bottomMargin).offset(16)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
        postText.snp.makeConstraints { make in
            make.top.equalTo(postTitle.snp_bottomMargin).offset(16)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
        likeImage.snp.makeConstraints { make in
            make.top.equalTo(postText.snp_bottomMargin).offset(16)
            make.left.equalToSuperview().offset(16)
            make.height.equalTo(20)
        }
        
        likeCounter.snp.makeConstraints { make in
            make.centerY.equalTo(likeImage)
            make.left.equalTo(likeImage.snp_rightMargin).offset(12)
        }
        
        postDate.snp.makeConstraints { make in
            make.centerY.equalTo(likeCounter)
            make.right.equalToSuperview().offset(-16)
        }
    }
}
