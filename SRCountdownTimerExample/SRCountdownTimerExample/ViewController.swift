//
//  ViewController.swift
//  SRCountdownTimerExample
//
//  Created by Ruslan Serebriakov on 5/13/17.
//  Copyright © 2017 Ruslan Serebriakov. All rights reserved.
//

import UIKit
import SRCountdownTimer

class ViewController: UIViewController {
    @IBOutlet weak var countdownTimer: SRCountdownTimer!

    override func viewDidLoad() {
        super.viewDidLoad()

        countdownTimer.labelFont = UIFont(name: "HelveticaNeue-Light", size: 50.0)
        countdownTimer.labelTextColor = UIColor.red
        countdownTimer.timerFinishingText = "End"
        countdownTimer.lineWidth = 4
        countdownTimer.start(beginingValue: 10, interval: 1)
    }
}

