//
//  Model.swift
//  RickAndMorty
//
//  Created by Nikita Soldatov on 26.11.2019.
//  Copyright © 2019 Nikita Soldatov. All rights reserved.
//

import Foundation

// MARK: - Character
struct Character: Codable {
  enum Gender: String, Codable {
    case mail = "Male"
    case unknown = "unknown"
    case female = "Female"
    case genderless = "Genderless"
  }
  let id: Int
  let name, status, species, type: String
  let gender: Gender
  let origin: Location
  let location: Location
  let image: URL
  let episode: [URL]
  let url: URL
}

// MARK: - Location
struct Location: Codable {
  let name: String
  let url: String
}
