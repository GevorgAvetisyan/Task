//
//  TransactionDateCollectionReusableView.swift
//  Task
//
//  Created by Gevorg Avetisyan on 02.02.22.
//

import UIKit

class TransactionDateCollectionReusableView: UICollectionReusableView {

    //MARK: - IBOutlets -
    
    @IBOutlet weak var dateLabel: UILabel!
    
    //MARK: - Configurations -
    
    func configure(date: String) {
        dateLabel.text = date
    }
}
