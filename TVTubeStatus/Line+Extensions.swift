//
//  Line+Colour.swift
//  TVTubeStatus
//
//  Created by Simon Rice on 18/06/2017.
//  Copyright © 2017 Simon Rice. All rights reserved.
//

import RxTfL
import UIKit

extension Line {
    var colour: UIColor {
        switch self.id ?? "" {
        case "bakerloo": return .korma
        case "central": return .fireEngineRed
        case "circle": return .sunglow
        case "district": return .laSalleGreen
        case "dlr": return .lightSeaGreen
        case "hammersmith-city": return .careysPink
        case "jubilee": return .osloGray
        case "london-overground": return .deepCarrotOrange
        case "metropolitan": return .pansyPurple
        case "northern": return .black
        case "piccadilly", "tfl-rail": return .kleinBlue
        case "tram": return .limeGreen
        case "victoria": return .cerulean
        case "waterloo-city": return .downy
        default: return .clear
        }
    }

    var mainLineStatus: LineStatus? {
        return (lineStatuses ?? [])
            .sorted(by: { ($0.0.statusSeverity ?? 0) > ($0.1.statusSeverity ?? 0) })
            .first
    }
}
