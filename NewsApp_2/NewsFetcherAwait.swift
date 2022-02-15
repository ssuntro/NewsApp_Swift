//
//  NewsFetcherAwait.swift
//  NewsApp_2
//
//  Created by Siroratt Suntronsuk on 15/2/2565 BE.
//

import Foundation
struct NewsFetcherAwait {
    //getter veriable
    var task: Task<[News], Error> {
        return Task { () -> [News] in
            let url = URL(string: "https://www.hackingwithswift.com/samples/petitions-2.json")!
            let (_, response) = try await URLSession.shared.data(from: url)
            print("3: NewsFetcherAwait: received response")
            return [News]()
        }
    }
}
