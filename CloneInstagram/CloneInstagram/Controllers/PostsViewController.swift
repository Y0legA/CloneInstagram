//
//  ViewController.swift
//  CloneInstagram
//
//  Created by Oleg_Yakovlev on 17.10.22.
//

import UIKit

// Домашний экран
final class PostsViewController: UIViewController {
    private enum TableCellTypes {
        case stories
        case startPost
        case recommended
        case posts
    }
    
    private enum CellIdentifiers: String {
        case storiesCell = "storiesTableViewCell"
        case postCell = "postTableViewCell"
        case recommendedCell = "recommendedTableViewCell"
    }
    
    // MARK: - Private IBoutlet
    @IBOutlet private weak var storiesTableView: UITableView!
    
    // MARK: - Private Visual Components
    private var refreshControl = UIRefreshControl()
    
    // MARK: - Public Properties
    private var posts: [TableCellTypes] = [TableCellTypes.startPost, TableCellTypes.startPost, TableCellTypes.startPost]
    
    // MARK: - Private Properties
    private var cellTypes: [TableCellTypes] = [.stories, .startPost, .recommended, .posts]
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Private IBAction
    @objc private func uploadDataAction() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.storiesTableView.refreshControl?.endRefreshing()
            self.storiesTableView.reloadData()
        }
    }
    // MARK: - Private Methods
    private func setupRefreshcontrol() {
        refreshControl.addTarget(self, action: #selector(uploadDataAction), for: .valueChanged)
        storiesTableView.refreshControl = refreshControl
    }
    
    private func configureUI() {
        storiesTableView.delegate = self
        storiesTableView.dataSource = self
        setupRefreshcontrol()
    }
}

// UITableViewDataSource
extension PostsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        cellTypes.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let cellType = cellTypes[section]
        switch cellType {
        case .startPost:
            return 1
        case .stories:
            return 1
        case .recommended:
            return 1
        case .posts:
            return posts.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellType = cellTypes[indexPath.section]
        switch cellType {
        case .stories:
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.storiesCell.rawValue)
            ?? UITableViewCell()
            return cell
        case .startPost, .posts:
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.postCell.rawValue)
            ?? UITableViewCell()
            return cell
        case .recommended:
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.recommendedCell.rawValue)
            ?? UITableViewCell()
            return cell
        }
    }
}

// UITableViewDelegate
extension PostsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) ->
    CGFloat {  return UITableView.automaticDimension
    }
}
