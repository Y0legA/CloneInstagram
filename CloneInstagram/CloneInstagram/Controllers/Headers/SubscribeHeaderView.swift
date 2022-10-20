//
//  SubscribeHeaderView.swift
//  CloneInstagram
//
//  Created by Oleg_Yakovlev on 20.10.22.
//

import UIKit

// Вью хедера раздела подписок
final class SubscribeHeaderView: UIView {
    private enum Constants {
        static let today = "Сегодня"
        static let onWeek = "На этой неделе"
        static let onMonth = "В этом месяце"
        static let arial = "Arial Bold"
    }
    
    // этот энам нельзя сделать приватным
    enum HeaderType: Int {
        case today = 0
        case onWeek
        case onMonth
        
        var title: String {
            var title: String = .init()
            switch self {
            case .today:
                title = Constants.today
            case .onWeek:
                title = Constants.onWeek
            case .onMonth:
                title = Constants.onMonth
            }
            return title
        }
    }
  
    // MARK: - Private Visual Components
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.arial, size: 19)
        return label
    }()
    
    // MARK: - Private Properties
    private let type: HeaderType
    
    // MARK: - Initializers
    init(frame: CGRect = .zero, type: HeaderType) {
        self.type = type
        super.init(frame: frame)
        headerLabel.text = type.title
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LifeCycle
    override func layoutSubviews() {
        headerLabel.frame = CGRect(origin: CGPoint(x: bounds.minX + 16, y: 0), size: bounds.size)
    }
 
    // MARK: - Private Methods
    private func configureUI() {
        addSubview(headerLabel)
    }
}
