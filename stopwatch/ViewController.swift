//
//  ViewController.swift
//  stopwatch
//
//  Created by Nency on 2021-01-18.
//  Copyright © 2021 Nency. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return laps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LapTableCell", for:  indexPath) as! LapTableCell
        cell.initCell(time: laps[indexPath.row], count: "Lap \(indexPath.row + 1 )")
        return cell
    }
    

    var timer = Timer()
    var (minutes, seconds, miliseconds) = (0, 0, 0)
    
    var laps : [String] = []
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var lapButton: UIButton!
    @IBOutlet weak var lapTable: UITableView!
    @IBOutlet weak var timeLabel: UILabel!
    
    
    @IBAction func startBtn(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(keepTimer), userInfo: nil, repeats: true)
        stopButton.isHidden = false
        startButton.isHidden = true
        lapButton.isHidden = false
        resetButton.isHidden = true
    }
    
    @IBAction func stopBtn(_ sender: UIButton) {
        timer.invalidate()
        stopButton.isHidden = true
        startButton.isHidden = false
        lapButton.isHidden = true
        resetButton.isHidden = false
    }
    
    @IBAction func lapBtn(_ sender: Any) {
        if let lapTime: String = timeLabel?.text{
            if startButton.isHidden == true {
                laps.append(lapTime)
            }
        }
        lapTable.reloadData()
    }
    
    @IBAction func resetBtn(_ sender: Any) {
        (minutes, seconds, miliseconds) = (0, 0, 0)
        timeLabel.text = "\(minutes) : \(seconds).\(miliseconds)"
        laps = []
        lapTable.reloadData()
        stopButton.isHidden = true
        startButton.isHidden = false
        lapButton.isHidden = false
        resetButton.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lapTable.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    @objc func keepTimer() {
        miliseconds += 1
        if miliseconds > 9 {
            seconds += 1
            miliseconds = 0
        }
        
        if seconds > 59 {
            minutes += 1
            seconds = 0
        }
        
        timeLabel.text = "\(minutes) : \(seconds).\(miliseconds)"
        
    }

}

