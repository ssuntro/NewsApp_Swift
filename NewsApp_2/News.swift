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
    let body = "annJaannJa annJaannJaannJaannJaannJaannJaannJaannJaannJaannJa"
    let url = "https://i.guim.co.uk/img/media/fe1e34da640c5c56ed16f76ce6f994fa9343d09d/0_174_3408_2046/master/3408.jpg?width=1200&height=1200&quality=85&auto=format&fit=crop&s=67773a9d419786091c958b2ad08eae5e"
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
