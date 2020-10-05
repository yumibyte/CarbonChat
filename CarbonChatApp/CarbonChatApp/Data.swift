//
//  Data.swift
//  CarbonChatApp
//
//  Created by wenlock on 10/4/20.
//

import Foundation

struct CarbonChatPing: Codable {
    let message: String
    let gitsha: String
    let datetime: String
    init(withMessage message: String) {
        self.message = message
        self.gitsha = ""
        self.datetime = ""
    }
}
