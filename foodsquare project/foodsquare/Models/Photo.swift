//
//  Photo.swift
//  foodsquare
//
//  Created by C4Q on 1/23/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation

struct AllData: Codable {
    let meta: Meta
    let response: Response
}

struct Meta: Codable {
    let code: Int
    let requestID: String
    
    enum CodingKeys: String, CodingKey {
        case code
        case requestID = "requestId"
    }
}

struct Response: Codable {
    let photos: Photos
}

struct Photos: Codable {
    let count: Int
    let items: [Item]
    let dupesRemoved: Int
}

struct Item: Codable {
    let id: String
    let createdAt: Int
    let source: Source
    let purplePrefix, suffix: String
    let width, height: Int
    let user: With
    let visibility: String
    let checkin: Checkin?
    
    enum CodingKeys: String, CodingKey {
        case id, createdAt, source
        case purplePrefix = "prefix"
        case suffix, width, height, user, visibility, checkin
    }
}

struct Checkin: Codable {
    let id: String
    let createdAt: Int
    let type: String
    let timeZoneOffset: Int
    let with: [With]?
}

struct With: Codable {
    let id, firstName: String
    let lastName: String?
    let gender: String
    let photo: Photo
}

struct Photo: Codable {
    let purplePrefix, suffix: String
    
    enum CodingKeys: String, CodingKey {
        case purplePrefix = "prefix"
        case suffix
    }
}

struct Source: Codable {
    let name, url: String
}
