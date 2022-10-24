//
//  ProfileDetailViewController.swift
//  CloneInstagram
//
//  Created by Oleg_Yakovlev on 22.10.22.
//

import UIKit

// Экран детальной информации
final class ProfileDetailViewController: UIViewController {
    private enum Constants {
        static let identifiers: [Identifiers] = [.profileSubscribeLikes, .profileInfoDetail, .actuality, .postInfo]
    }
    
    private enum Identifiers: String {
        case profileSubscribeLikes = "profileSubscribeLikesTableViewCell"
        case profileInfoDetail = "profileInfoDetailTableViewCell"
        case actuality = "actualityInfoTableViewCell"
        case postInfo = "postInfoTableViewCell"
        case postImageView = "postImageCollectionViewCell"
        case postInfoViewController = "postInfoViewController"
    }
    
    // MARK: - Private IBoutlet
    @IBOutlet weak var profileTableView: UITableView!
    
    // MARK: - Private Visual Components
    private var refreshControl = UIRefreshControl()
    
    // MARK: - Private Properties
    private let infoPosts: [InfoPost] = [firstInfoPost, secondInfoPost, threeInfoPost, fourInfoPost
                                         , fiveInfoPost, sixInfoPost, sevenInfoPost, eightInfoPost
                                         , nineInfoPost, tenInfoPost, elevenInfoPost
                                         , twelveInfoPost, thirteenInfoPost
                                         , forteenInfoPost, fifteenInfoPost, sixteenInfoPost, seventeenInfoPost]
    
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
        profileTableView.refreshControl = refreshControl
    }
    
    private func configureTableView() {
        profileTableView.delegate = self
        profileTableView.dataSource = self
        profileTableView.rowHeight = UITableView.automaticDimension
        setupRefreshcontrol()
    }
}

// UITableViewDataSource
extension ProfileDetailViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Constants.identifiers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellType = Constants.identifiers[indexPath.row]
        switch cellType {
        case .profileSubscribeLikes:
            print(Identifiers.profileSubscribeLikes.rawValue)
            return tableView.dequeueReusableCell(withIdentifier:
                                                    Identifiers.profileSubscribeLikes.rawValue, for: indexPath)
        case .profileInfoDetail:
            return tableView.dequeueReusableCell(withIdentifier:
                                                    Identifiers.profileInfoDetail.rawValue, for: indexPath)
        case .actuality:
            return tableView.dequeueReusableCell(withIdentifier:
                                                    Identifiers.actuality.rawValue, for: indexPath)
        case .postInfo:
            return tableView.dequeueReusableCell(withIdentifier:
                                                    Identifiers.postInfo.rawValue, for: indexPath)
        default:
            return UITableViewCell()
        }
    }
}

// UITableViewDelegate
extension ProfileDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) ->
    CGFloat {  return UITableView.automaticDimension }
}

// UICollectionViewDataSource
extension ProfileDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        infoPosts.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier
                                                         : Identifiers.postImageView.rawValue, for: indexPath)
            as? PostInfoCollectionViewCell {
            cell.imageView = infoPosts[indexPath.row]
            return cell
        }
        return UICollectionViewCell()
    }
}
