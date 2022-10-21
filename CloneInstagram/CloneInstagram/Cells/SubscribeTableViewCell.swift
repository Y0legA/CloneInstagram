//
//  SubscribeTableViewCell.swift
//  CloneInstagram
//
//  Created by Oleg_Yakovlev on 19.10.22.
//

import UIKit

// Ячейка подписок
final class SubscribeTableViewCell: UITableViewCell {
    private enum Constant {
        static let emptyString = ""
        static let subscribe = "Вы подписаны"
    }
    
    // MARK: - Private IBoutlet
    @IBOutlet private weak var commentAuthorAvatarImageView: UIImageView!
    @IBOutlet private weak var commentLabel: UILabel!
    @IBOutlet private weak var subscriptionButton: UIButton!
    @IBOutlet private weak var commentImageView: UIImageView!
    @IBOutlet private weak var reactionImageView: UIImageView!
    @IBOutlet private weak var answerButton: UIButton!

    // MARK: - Private Properties
    private var time = Constant.emptyString
    private var comment = Constant.emptyString
    private var author = Constant.emptyString

    // MARK: - Public Methods
    func configureData(_ model: Subscribe) {
        commentAuthorAvatarImageView.image = UIImage(named: model.commentAuthorAvatarImageName)
        author = model.commentAuthorAvatarImageName
        time = model.passedTime
        comment = model.commentText
        commentLabel.attributedText = setupDeliveryDateLabel()
        guard let subscribe = model.isSubscribe else {
            commentImageView.image = UIImage(named: model.postImageName)
            guard model.isReaction else { return }
            reactionImageView.isHidden = false
            reactionImageView.image = UIImage(systemName: model.reactionImageName)
            answerButton.isHidden = false
            return
        }
        commentLabel.translatesAutoresizingMaskIntoConstraints = false
        commentLabel.widthAnchor.constraint(equalToConstant: subscriptionButton.bounds.width).isActive = true
        commentImageView.frame.size.width = subscriptionButton.frame.width
        subscriptionButton.isHidden = false
            if subscribe {
                subscriptionButton.setTitle(Constant.subscribe, for: .normal)
                subscriptionButton.backgroundColor = .clear
                subscriptionButton.layer.borderColor = UIColor.lightGray.cgColor
                subscriptionButton.layer.borderWidth = 1
            }
    }
    
    // MARK: - Private IBAction
    @IBAction private func answerAction() {
    }
    
    // MARK: - Private Methods
    // Метод для форматирования строки
    private func setupDeliveryDateLabel() -> NSMutableAttributedString {
        let myMutableString = NSMutableAttributedString(string: "\(author) \(comment)  \(time)")
        myMutableString.addAttribute(
            NSAttributedString.Key.font,
            value: UIFont.systemFont(ofSize: 20, weight: .bold),
            range: NSRange(location: 0, length: author.count)
        )
        myMutableString.addAttribute(
            NSAttributedString.Key.font,
            value: UIFont.systemFont(ofSize: 17, weight: .semibold),
            range: NSRange(location: author.count, length: comment.count)
        )
        myMutableString.addAttribute(
            NSAttributedString.Key.font,
            value: UIFont.systemFont(ofSize: 16, weight: .regular),
            range: NSRange(location: comment.count + 1, length: time.count)
        )
        myMutableString.addAttribute(
            NSAttributedString.Key.foregroundColor,
            value: UIColor.lightGray,
            range: NSRange(location: author.count + comment.count + 1, length: time.count)
        )
        return myMutableString
    }
}
