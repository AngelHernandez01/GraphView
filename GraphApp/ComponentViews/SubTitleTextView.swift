//
//  SubTitleTextView.swift
//  GraphApp
//
//  Created by Angel Hernández on 12/15/20.
//

import SwiftUI

struct SubTitleTextView: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding([.leading], 20)
            .padding([.top], 10)
            .font(Font(UIFont.subTitleTextView))
    }
}
