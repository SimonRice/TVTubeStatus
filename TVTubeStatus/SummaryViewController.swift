//
//  ViewController.swift
//  TVTubeStatus
//
//  Created by Simon Rice on 18/06/2017.
//  Copyright © 2017 Simon Rice. All rights reserved.
//

import RxCocoa
import RxSwift
import RxTfL
import UIKit

class SummaryViewController: UIViewController {
    private let bag = DisposeBag()
    private let modes = ["tube","dlr","overground","tflrail","tram"]
    private var lines: [Line] = []

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let statusObservable = LineAPI.lineGetByMode(modes: modes)
            .flatMap({ Observable.from($0) })
            .map({ $0.id ?? "" })
            .filter({ $0 != "" })
            .toArray()
            .flatMap({ LineAPI.lineStatusByIds(ids: $0, detail: false) })
            .share()

        statusObservable.subscribe(onNext: { self.lines = $0 })
            .addDisposableTo(bag)

        statusObservable.observeOn(MainScheduler.instance)
            .bind(to: tableView.rx.items(cellIdentifier: "LineRow")) { (_, line, cell) in

                cell.textLabel?.text = line.name
                cell.detailTextLabel?.text = line.mainLineStatus?
                    .statusSeverityDescription

                let colour = line.colour
                cell.contentView.backgroundColor = colour
                cell.textLabel?.textColor = colour.contrastingTextColour
                cell.detailTextLabel?.textColor = colour.contrastingTextColour
                    .withAlphaComponent(0.6)

            }.addDisposableTo(bag)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let details = segue.destination as? DetailViewController,
            let selected = tableView.indexPathForSelectedRow {

            tableView.deselectRow(at: selected, animated: true)
            details.line = lines[selected.row]
        }
    }
}

