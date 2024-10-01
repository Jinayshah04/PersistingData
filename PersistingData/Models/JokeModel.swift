//
//  JokeModel.swift
//  PersistingData
//
//  Created by mobile1 on 27/09/24.
//

import Foundation

struct JokeModel: Codable {
    let id : Int
    let type : String
    let setup : String
    let punchLine : String
}
