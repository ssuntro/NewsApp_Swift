//
//  News.swift
//  NewsApp_2
//
//  Created by Siroratt Suntronsuk on 8/2/2565 BE.
//

import Foundation
import UIKit

struct News {
    let detail: NewsDetail
    let category: NewsCategory
}

struct NewsDetail: Decodable {
    let title: String
    let body: String
    let status: NewsStatus
    let url: String
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

enum NewsCategory: Int, Codable {
    case animal = 0
    case globalWarming = 1
    case finance = 2
    
    var imageName: String {
        switch self {
        case .animal:
            return "animal"
        case .globalWarming:
            return "globalWarming"
        case .finance:
            return "finance"
        }
    }
}



