//
//  Blur.swift
//  Barhop
//
//  Created by Zoe Schmitt on 4/4/20.
//  Copyright © 2020 Zoe Schmitt. All rights reserved.
//

import SwiftUI

struct Blur: UIViewRepresentable {
    var style: UIBlurEffect.Style = .systemChromeMaterial
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}
