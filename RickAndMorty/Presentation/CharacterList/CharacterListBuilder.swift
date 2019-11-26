//
//  CharacterListBuilder.swift
//  RickAndMorty
//
//  Created by Nikita Soldatov on 26.11.2019.
//  Copyright © 2019 Nikita Soldatov. All rights reserved.
//

import SwiftUI

enum CharacterListBuilder {
  static func makeCharacterList() -> some View{
    return CharacterListView(
      viewModel: CharacterListViewModel()
    )
  }
}
