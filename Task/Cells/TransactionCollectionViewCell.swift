//
//  TransactionCollectionViewCell.swift
//  Task
//
//  Created by Gevorg Avetisyan on 02.02.22.
//

import UIKit

enum TransactionCollectionViewCellPosition {
    case top
    case bottom
    case all
    case center
}

class TransactionCollectionViewCell: UICollectionViewCell {

    //MARK: - IBOutlets -
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    //MARK: - Setup -
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.layer.masksToBounds = true
    }
    
    //MARK: - Configuration -
    
    func configureCell(model: TransactionModel, position: TransactionCollectionViewCellPosition) {
        typeLabel.text = model.type.title
        amountLabel.text = "\(model.type.sign)\(model.amount)"
        amountLabel.textColor = model.type.color
        descriptionLabel.text = model.description
        backView.layer.cornerRadius = position == .center ? 0 : 20
        configureBackViewsCorners(position: position)
    }
    
    private func configureBackViewsCorners(position: TransactionCollectionViewCellPosition) {
        switch position {
        case .top:
            backView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        case .bottom:
            backView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        case .all:
            backView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        case .center:
            break
        }
    }
}
