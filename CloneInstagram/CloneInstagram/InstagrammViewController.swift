//
//  ViewController.swift
//  CloneInstagram
//
//  Created by Oleg_Yakovlev on 17.10.22.
//

import UIKit

// Домашний экран
final class InstagrammViewController: UIViewController {
    enum TableCellTypes {
        case stories
        case startPost
        case recommended
        case posts
    }
    
    enum CellIdentifiers: String {
        case storiesCell = "storiesTableViewCell"
        case postCell = "postTableViewCell"
        case recommendedCell = "recommendedTableViewCell"
    }

    // MARK: - Private IBoutlet
    @IBOutlet private weak var storiesTableView: UITableView!
    
    // MARK: - Private Visual Components
    private var refreshControl = UIRefreshControl()

    // MARK: - Public Properties
    private var posts: [TableCellTypes] = []
    
    // MARK: - Private Properties
    private var cells: [TableCellTypes] = [.stories, .startPost, .recommended, .posts]
  
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
    private func upload() {
        refreshControl.addTarget(self, action: #selector(uploadDataAction), for: .valueChanged)
        storiesTableView.refreshControl = refreshControl
    }
    
    private func configureUI() {
        storiesTableView.delegate = self
        storiesTableView.dataSource = self
        generatePosts()
        upload()
    }
    
    private func generatePosts() {
        posts = [TableCellTypes.startPost, TableCellTypes.startPost, TableCellTypes.startPost]
    }
}

// UITableViewDataSource
extension InstagrammViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        cells.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let cellType = cells[section]
        switch cellType {
        case .startPost :
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
        let cellType = cells[indexPath.section]
        switch cellType {
        case .stories:
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.storiesCell.rawValue) ?? UITableViewCell()
            return cell
        case .startPost, .posts:
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.postCell.rawValue) ?? UITableViewCell()
            return cell
        case .recommended:
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.recommendedCell.rawValue) ?? UITableViewCell()
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {  return UITableView.automaticDimension
    }
}

// UITableViewDelegate
extension InstagrammViewController: UITableViewDelegate {
}
