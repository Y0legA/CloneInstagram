//
//  Extention+SubscribeTableViewCell.swift
//  CloneInstagram
//
//  Created by Oleg_Yakovlev on 21.10.22.
//

import UIKit

extension SubscribeTableViewCell {
    // Метод для форматирования строки
    func setupDeliveryDateLabel(_ author: String, _ comment: String, _ time: String) ->
    NSMutableAttributedString {
        let myMutableString = NSMutableAttributedString(string: "\(author) \(comment)  \(time)")
        myMutableString.addAttribute(
            NSAttributedString.Key.font,
            value: UIFont.systemFont(ofSize: 15, weight: .bold),
            range: NSRange(location: 0, length: author.count)
        )
        myMutableString.addAttribute(
            NSAttributedString.Key.font,
            value: UIFont.systemFont(ofSize: 15, weight: .regular),
            range: NSRange(location: author.count, length: comment.count)
        )
        myMutableString.addAttribute(
            NSAttributedString.Key.font,
            value: UIFont.systemFont(ofSize: 14, weight: .regular),
            range: NSRange(location: comment.count + 1, length: time.count)
        )
        myMutableString.addAttribute(
            NSAttributedString.Key.foregroundColor,
            value: UIColor.lightGray,
            range: NSRange(location: author.count + comment.count + 3, length: time.count)
        )
        return myMutableString
    }
}
