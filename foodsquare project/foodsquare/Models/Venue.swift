//
//  Venue.swift
//  foodsquare
//
//  Created by C4Q on 1/23/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation

struct VenueCall: Codable {
    var response: ResponseWrapper
}

struct ResponseWrapper: Codable {
    var venues: [Venue]
}

struct Venue: Codable {
    var id: String
    var name: String
    var contact: Contact
    var location: Location
    var categories: [Category]
}

struct Contact: Codable {
    var phone: String?
    var formattedPhone: String?
}

struct Location: Codable {
    var formattedAddress: [String]
}

struct Category: Codable {
    var name: String
}
