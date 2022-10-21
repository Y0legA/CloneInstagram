//
//  SubscribesViewController.swift
//  CloneInstagram
//
//  Created by Oleg_Yakovlev on 19.10.22.
//

import UIKit

// Экран подписок
final class SubscribesViewController: UIViewController {
    private enum Constants {
        static let subscribeCell = "subscribeCell"
    }
    
    private enum TableSectionsTypes {
        case today
        case week
        case month
    }
    
    // MARK: - Private IBoutlet
    @IBOutlet private weak var subscribesTableView: UITableView!
    
    // MARK: - Private Visual Components
    private var refreshControl = UIRefreshControl()
    
    // MARK: - Public Properties
    var datas: [[Subscribe]] = [[]]
    
    // MARK: - Private Properties
    private let cellTypes: [TableSectionsTypes] = [.today, .week, .month]
    private let todayPosts = [onePost, twoPost, threePost]
    private let weekPosts = [fourPost, fivePost, sixPost, sevenPost]
    private let monthPosts = [eightPost, ninePost, tenPost]

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }

    // MARK: - Private IBAction
    @objc private func uploadDataAction() {
        refreshControl.endRefreshing()
    }
    
    // MARK: - Private Methods
    private func setupRefreshcontrol() {
        refreshControl.addTarget(self, action: #selector(uploadDataAction), for: .valueChanged)
                subscribesTableView.refreshControl = refreshControl
    }
    
    private func configureTableView() {
        subscribesTableView.delegate = self
        subscribesTableView.dataSource = self
        subscribesTableView.rowHeight = UITableView.automaticDimension
        datas = [todayPosts, weekPosts, monthPosts]
        setupRefreshcontrol()
    }
}

 // UITableViewDataSource
extension SubscribesViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        cellTypes.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let cellType = cellTypes[section]
        switch cellType {
        case .today:
            return todayPosts.count
        case .week:
            return weekPosts.count
        case .month:
            return monthPosts.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.subscribeCell)
                as? SubscribeTableViewCell else { return UITableViewCell() }
        let model = datas[indexPath.section][indexPath.row]
        cell.configureData(model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        30
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerType = SubscribeHeaderView.HeaderType(rawValue: section) else { return nil}
        let header = SubscribeHeaderView(type: headerType)
        return header
    }
}

// UITableViewDelegate
extension SubscribesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) ->
    CGFloat {  return UITableView.automaticDimension
    }
}
