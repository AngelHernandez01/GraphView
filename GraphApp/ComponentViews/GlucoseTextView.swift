//
//  GlucoseTextView.swift
//  GraphApp
//
//  Created by Angel Hernández on 12/15/20.
//

import SwiftUI

struct GlucoseTextView: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding([.leading], 20)
            .padding([.top], 10)
            .font(Font(UIFont.glucoseTitleTextView))
    }
}
