//
//  TransactionModel.swift
//  Task
//
//  Created by Gevorg Avetisyan on 02.02.22.
//

import UIKit

struct TransactionModel {
    var type: TransactionType
    var amount: Int
    var description: String
}

enum TransactionType {
    case payment
    case accrual
    
    var title: String {
        switch self {
        case .payment:
            return "Оплата"
        case .accrual:
            return "Начисление"
        }
    }
    
    var color: UIColor {
        switch self {
        case .payment:
            return .systemRed
        case .accrual:
            return .systemGreen
        }
    }
    
    var sign: String {
        switch self {
        case .payment:
            return "-"
        case .accrual:
            return "+"
        }
    }
}
