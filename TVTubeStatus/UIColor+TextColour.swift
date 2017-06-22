//
//  UIColor+TextColour.swift
//  TVTubeStatus
//
//  Created by Simon Rice on 18/06/2017.
//  Copyright © 2017 Simon Rice. All rights reserved.
//

import UIKit

extension UIColor {
    var perceivedBrightness: Float {
        var fRed : CGFloat = 0
        var fGreen : CGFloat = 0
        var fBlue : CGFloat = 0

        if self.getRed(&fRed, green: &fGreen, blue: &fBlue, alpha: nil) {
            let pRed = fRed * fRed * 0.299 * 255 * 255
            let pGreen = fGreen * fGreen * 0.587 * 255 * 255
            let pBlue = fBlue * fBlue * 0.114 * 255 * 255

            return sqrtf(Float(pRed + pGreen + pBlue))
        } else {
            // Could not extract RGBA components:
            return 255
        }
    }

    var contrastingTextColour: UIColor {
        return perceivedBrightness > 130 ? .black : .white
    }
}
