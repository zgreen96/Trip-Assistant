//
//  Data.swift
//  Trip_Assistant_V01
//
//  Created by ios e on 4/9/18.
//  Copyright © 2018 ios-e. All rights reserved.
//

import Foundation

struct Trip: Codable {
    
    var tripCode: Int
    var title: String
    var location: String //check me
    var Itinerary: [Activity]
    var attendance: Bool //make a struct with location
    var startDate: String
    var endDate: String
    
}

struct Activity: Codable {
    var dates: String
    var title: String
    var description: String!
    var location: String // check me
    var startTime: String
    var endTime: String
}

struct User: Codable {
    var username: String
    var password: String
    var name : String
    var phone: String
    var email: String
    var isChap: Bool
    
    //var location: String //check me
    //var trips: [Trip]
    
}
