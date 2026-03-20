//
//  Text+GhostButton.swift
//  SwiftUIMovie
//
//  Created by Saurabh Jaiswal on 21/03/26.
//

import SwiftUI

extension Text {
    func ghostButton() -> some View {
        self
            .frame(width: 100, height: 50)
            .foregroundStyle(.buttonText)
            .bold()
            .background {
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .stroke(.buttonBorder, lineWidth: 5)
            }
    }
}
