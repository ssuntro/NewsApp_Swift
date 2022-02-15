//
//  NewsFetcher.swift
//  NewsApp_2
//
//  Created by Siroratt Suntronsuk on 15/2/2565 BE.
//

import Foundation


//let stubData = [News(detail: NewsDetail(title: "news1", status: .closed), category: .animal),
//                News(detail: NewsDetail(title: "news2", status: .closed), category: .animal),
//                News(detail: NewsDetail(title: "news3", status: .pendingResponse), category: .globalWarming)]

struct NewsFetcher {
    var task: URLSessionDataTask?
    
    mutating func exe(completion: @escaping (([News]) -> Void)) {
        task?.cancel()
        let url = URL(string: "https://www.hackingwithswift.com/samples/petitions-2.json")!
        task = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            guard error == nil,
                  let response = response as? HTTPURLResponse,
                  response.statusCode == 200,
                  let data = data,
                  let dict = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                  let rawdata = dict["results"] as? [[String: Any]] else {
                      print("Annja")
                      return
                  }
                  
            
            /////// error == nil &&
            ///statusCode == 200 &&
            ///data is not nil &&
            ///data able to convert to dict
            ///can convert to [[String: Any]] as a rawData
            ///
//            let animal = rawdata[0...4].compactMap { elem -> News? in
//                if let data = try? JSONSerialization.data(withJSONObject: elem, options: []),
//                   let newsDetail = try? JSONDecoder().decode(NewsDetail.self, from: data) {
//                    return News(detail: newsDetail, category: .animal)
//                }
//                return nil
//            }
            
            let result = [rawdata[0...4],
                          rawdata[5...9],
                          rawdata[10...14]]
                .enumerated()
                .map { (index, elem) in
                    elem.compactMap { elem -> News? in
                        if let data = try? JSONSerialization.data(withJSONObject: elem, options: []),
                           let newsDetail = try? JSONDecoder().decode(NewsDetail.self, from: data),
                           let category = NewsCategory(rawValue: index) {
                            return News(detail: newsDetail, category: category)
                        }
                        return nil
                    }
            }
            
            
            DispatchQueue.main.async {
                completion(result[0] + result[1] + result[2])
                completion(result[0])
                completion(result[1])
            }
        })
        task?.resume()
    }
}
