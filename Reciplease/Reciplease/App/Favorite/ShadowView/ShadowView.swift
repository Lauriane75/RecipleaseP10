//
//  ShadowView.swift
//  Reciplease
//
//  Created by Lauriane Haydari on 27/11/2019.
//  Copyright © 2019 Lauriane Haydari. All rights reserved.
//

import UIKit

final class ShadowView: UIView {
    // Layer from UIView, considered as class LinearGradientLayer
    lazy var shadowLayer = layer as? LinearGradientLayer

    // In order to use Layer, we have to specifize its class
    override class var layerClass: AnyClass {
        return LinearGradientLayer.self
    }

    // Update gradient with its direction (enum) and [UIColor]
    func updateGradient(with direction: LinearGradientLayer.Direction, colors: UIColor...) {
        shadowLayer?.direction = direction
        shadowLayer?.colors = colors.map { $0.cgColor}
        shadowLayer?.setNeedsDisplay()
    }
}
