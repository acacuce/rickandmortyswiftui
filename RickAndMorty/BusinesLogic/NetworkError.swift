//
//  NetworkError.swift
//  RickAndMorty
//
//  Created by Nikita Soldatov on 26.11.2019.
//  Copyright © 2019 Nikita Soldatov. All rights reserved.
//

import Foundation
enum NetworkError: Error {
  case parsing(description: String)
  case network(description: String)
}
