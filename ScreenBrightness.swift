//
//  ScreenBrightness.swift
//  NewsApp_2
//
//  Created by Siroratt Suntronsuk on 8/2/2565 BE.
//

import Foundation
import UIKit

protocol UIScreenInterface {
    var brightness: CGFloat { get set }
}

extension UIScreen: UIScreenInterface {}

final class ScreenBrightness {
    private lazy var initialScreenBrightness = screen.brightness
    private var screen: UIScreenInterface

    private struct Constants {
        static let maxScreenBrightness: CGFloat = 1
    }

    init(screen: UIScreenInterface = UIScreen.main) {
        self.screen = screen
    }

    func boostScreenBrightness() {
        initialScreenBrightness = screen.brightness
        DispatchQueue.main.async {
            self.screen.brightness = Constants.maxScreenBrightness
        }
    }

    func revertScreenBrightness() {
        DispatchQueue.main.async {
            self.screen.brightness = self.initialScreenBrightness
        }
    }
}
