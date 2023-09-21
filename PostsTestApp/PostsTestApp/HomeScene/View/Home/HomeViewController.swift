//
//  HomeViewController.swift
//  PostsTestApp
//
//  Created by Evgeniy Docenko on 30.08.2023.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    // MARK: - Properties
    var viewModel: HomeViewModel
    private var expandedIndex : IndexSet = []
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: String(describing: HomeTableViewCell.self))
        return tableView
    }()
    
    init(viewModel: HomeViewModel) {
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
        loadPosts()
    }
    
    override func viewWillLayoutSubviews() {
        setupConstraints()
    }
    
    // MARK: - Private funcs
    private func setupUI() {
        self.navigationController?.navigationBar.tintColor = UIColor.red
        self.view.backgroundColor = .white
        
        let sortImage = UIImage(named: ImageNames.settings.rawValue)
        let sortButton = UIBarButtonItem(
            image: sortImage,
            style: .plain,
            target: self,
            action: #selector(showSortOptions))
        self.navigationItem.rightBarButtonItem = sortButton
    }
    
    private func loadPosts() {
        viewModel.fetchPosts {
            switch self.viewModel.currentSortOption {
            case .byTimestamp:
                self.viewModel.postsArr.sort(by: { $0?.timeshamp ?? 0 > $1?.timeshamp ?? 0 })
            case .byLikesCount:
                self.viewModel.postsArr.sort(by: { $0?.likesCount ?? 0 > $1?.likesCount ?? 0 })
            }
            
            if self.viewModel.currentSortDirection == .ascending {
                self.viewModel.postsArr.reverse()
            }
            
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Selectors
    @objc
    private func showSortOptions() {
        let alertController = UIAlertController(title: "Sort Options", message: "Choose a sorting option", preferredStyle: .actionSheet)
        
        alertController.addAction(UIAlertAction(title: "By Timestamp", style: .default) { _ in
            self.viewModel.currentSortOption = .byTimestamp
            self.loadPosts()
        })
        
        alertController.addAction(UIAlertAction(title: "By Likes Count", style: .default) { _ in
            self.viewModel.currentSortOption = .byLikesCount
            self.loadPosts()
        })
        
        alertController.addAction(UIAlertAction(title: "Change Sort Direction", style: .default) { _ in
            self.viewModel.currentSortDirection = self.viewModel.currentSortDirection == .ascending ? .descending : .ascending
            self.loadPosts()
        })
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    // MARK: - Setup layout
    private func setupConstraints() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

// MARK: - UITableView DataSource
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.postsArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HomeTableViewCell.self), for: indexPath) as? HomeTableViewCell else { return UITableViewCell() }
        cell.configure(with: viewModel.postsArr[indexPath.row]!)
        
        cell.buttonTapСlosure = { [weak self] in
            guard let self = self else { return }
            if self.expandedIndex.contains(indexPath.row) {
                self.expandedIndex.remove(indexPath.row)
            } else {
                self.expandedIndex.insert(indexPath.row)
            }
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        
        //  Cell configuration (Expand/Collapse)
        if expandedIndex.contains(indexPath.row) {
            cell.previewLabel.numberOfLines = 0
            cell.configureButton(with: "Collapse")
        } else {
            cell.previewLabel.numberOfLines = 2
            cell.configureButton(with: "Expand")
        }
        
        return cell
    }
}
// MARK: - UITableView Delegate
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let post = viewModel.postsArr[indexPath.row] {
            viewModel.openDetailViewController(post)
        }
    }
}

