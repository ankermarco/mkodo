//
//  Decodable+Extensions.swift
//  MKNetworking
//
//  Created by Ke Ma on 24/04/2024.
//

import Foundation

extension Decodable {
    static func parse(jsonFile: String, in bundle: Bundle = Bundle(identifier: "ke.ma.MKNetworking")!) -> Self? {
        guard let url = bundle.url(forResource: jsonFile, withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let output = try? JSONDecoder().decode(self, from: data)
        else {
            return nil
        }
        
        return output
    }
}
