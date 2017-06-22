//
//  DetailViewController.swift
//  TVTubeStatus
//
//  Created by Simon Rice on 18/06/2017.
//  Copyright © 2017 Simon Rice. All rights reserved.
//

import RxTfL
import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var detailText: UITextView!
    @IBOutlet weak var titleLabel: UILabel!

    var line: Line!

    override func viewDidLoad() {
        super.viewDidLoad()

        detailText.text = (line.lineStatuses ?? [])
            .flatMap({ $0.reason })
            .joined(separator: "\n\n")
            .replacingOccurrences(of: "<P>", with: "\n")
            .replacingOccurrences(of: "</P>", with: "")

        titleLabel.backgroundColor = line.colour
        titleLabel.textColor = line.colour.contrastingTextColour
        titleLabel.text = [line.name, line.mainLineStatus?.statusSeverityDescription]
            .flatMap({ $0 })
            .joined(separator: " - ")
    }
}
