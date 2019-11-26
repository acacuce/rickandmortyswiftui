//
//  PaginationItem.swift
//  RickAndMorty
//
//  Created by Nikita Soldatov on 26.11.2019.
//  Copyright © 2019 Nikita Soldatov. All rights reserved.
//

import Foundation

struct PaginationItem<ResultItem: Codable>: Codable {
  struct Info: Codable {
    let count: Int
    let pages: Int
    let next: URL?
    let previous: URL?
  }
  
  let info: Info
  let results: [ResultItem]
}
