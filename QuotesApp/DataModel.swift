//
//  DataModel.swift
//  QuotesApp
//
//  Created by amtul imrana on 07/11/22.
//

import Foundation

struct something: Decodable {
    var quotes: [someData]
}

struct someData: Decodable {
    var id: Int?
    var quote: String?
    var author: String?
}

class jsonExtractor {
    static let shared = jsonExtractor()
    func fecthJsonData() -> [someData] {
        
        let endP = "https://dummyjson.com/quotes"
        guard let url = URL(string: endP) else {
            fatalError("URL is in bad format")
        }
        
        guard let data = try?Data(contentsOf: url)else {
            fatalError("Error while fetching data from URL")
        }
        
        guard let decodedData = try?JSONDecoder().decode(something.self, from: data) else {
            fatalError("Error while decoding the data ")
        }
        return decodedData.quotes
    }
}
