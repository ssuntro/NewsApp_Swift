//
//  News.swift
//  NewsApp_2
//
//  Created by Siroratt Suntronsuk on 8/2/2565 BE.
//

import Foundation
import UIKit

struct News {
    let title: String
    let status: NewsStatus
    let category: NewsCategory
}

enum NewsStatus: String, Codable {
    case closed
    case responded
    case pendingResponse = "pending response"
    
    var color: UIColor {
        switch self {
        case .responded:
            return UIColor.systemTeal
        case .pendingResponse:
            return UIColor.systemRed
        case .closed:
            return UIColor.systemGreen
        }
    }
}

enum NewsCategory: String, Codable {
    case animal
    case globalWarming
    case finance
    
    var imageName: String {
        return rawValue
    }
}


let stubData = [News(title: "news1", status: .closed, category: .animal),
                News(title: "news2", status: .responded, category: .globalWarming),
                News(title: "news3", status: .pendingResponse, category: .globalWarming),
                News(title: "news4", status: .closed, category: .finance)]
