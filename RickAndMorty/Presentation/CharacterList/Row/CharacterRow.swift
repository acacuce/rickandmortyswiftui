//
//  CharacterRow.swift
//  RickAndMorty
//
//  Created by Nikita Soldatov on 26.11.2019.
//  Copyright © 2019 Nikita Soldatov. All rights reserved.
//
import SwiftUI
import struct Kingfisher.KFImage
import struct Kingfisher.DownsamplingImageProcessor

struct CharacterRow: View {
  var viewModel: CharacterRowViewModel
  
  var body: some View {
    HStack {
      KFImage(
        viewModel.avatarURL,
        options: [
          .transition(.fade(0.2)),
          .processor(
            DownsamplingImageProcessor(size: CGSize(width: 48, height: 48))
          ),
          .cacheOriginalImage
        ]
      )
        .cancelOnDisappear(true)
        .frame(width: 48, height: 48)
        .cornerRadius(24)
      Text(viewModel.name).bold()
    }
  }
}

struct CharacterRow_Previews: PreviewProvider {
  static var previews: some View {
    CharacterRow(
      viewModel: CharacterRowViewModel(
        id: 1,
        name: "Rick Sanchez",
        avatarURL: URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg")!
      )
    )
  }
}
