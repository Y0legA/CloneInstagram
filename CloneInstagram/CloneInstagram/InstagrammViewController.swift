//
//  ViewController.swift
//  CloneInstagram
//
//  Created by Oleg_Yakovlev on 17.10.22.
//

import UIKit

// Экран инстаграмма
final class InstagrammViewController: UIViewController {
    enum Constants {
        enum Cell: String {
            case stories = "storiesTableViewCell"
            case post = "postTableViewCell"
            case recommended = "recommendedTableViewCell"
            case lastPost = "lastPostTableViewCell"
        }
        static let types: [CGFloat] = [130, 650, 400, 400]
    }
    
    // MARK: - Private IBoutlet
    @IBOutlet private weak var storiesTableView: UITableView!
    
    // MARK: - Private Visual Components
    private var refreshControl = UIRefreshControl()

    // MARK: - Private Properties
    private var cells: [Constants.Cell] = [.stories, .post, .recommended, .lastPost]
  
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
        upload()
    }
}

extension InstagrammViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        cells.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let typeCell = cells[indexPath.section]
        switch typeCell {
        case .stories:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Cell.stories.rawValue) ?? UITableViewCell()
            return cell
        case .post:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Cell.post.rawValue) ?? UITableViewCell()
            return cell
        case .recommended:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Cell.recommended.rawValue) ?? UITableViewCell()
            return cell
        case .lastPost:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Cell.lastPost.rawValue) ??  UITableViewCell()
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {  return Constants.types[indexPath.section]
    }
}
