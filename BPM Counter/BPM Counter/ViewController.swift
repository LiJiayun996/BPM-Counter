//
//  ViewController.swift
//  BPM Counter
//
//  Created by Jiayun Li on 2/6/19.
//  Copyright © 2019 Jiayun Li. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    var sequenceNumber = 0
    var totalSequenceNumber = 0
    
    var time1 : Double = 0.0
    var time2 : Double = 0.0
    
    var tInterval : Double = 0
    
    var tIntervalArray = [Double]()
    var avgBPM : Double = 0

    @IBOutlet weak var intervalDisplay: UILabel!
    @IBAction func BPMButtonPressed(_ sender: Any) {
        
        if sequenceNumber == 0 {
            time1 = CACurrentMediaTime()
            sequenceNumber += 1
        } else if sequenceNumber == 1{
            time2 = CACurrentMediaTime()
            sequenceNumber -= 1
        } else { print("Error Testing") }
        timeInterval()
        tIntervalArray.append(tInterval)
        if totalSequenceNumber == 0 {
            tIntervalArray.remove(at: 0)
            totalSequenceNumber += 1
        } else {totalSequenceNumber += 1}
        
        if tIntervalArray.count > 16 {
            tIntervalArray.remove(at: 0)
        }
        calcAverageBPM()
        print(tIntervalArray)
        print("avg BPM \(avgBPM)")
        if totalSequenceNumber > 1 {intervalDisplay.text = String(round(avgBPM))}
    }
    
    
    @IBAction func resetButtonPressed(_ sender: Any) {
        tIntervalArray.removeAll()
        avgBPM = 0
        totalSequenceNumber = 0
        intervalDisplay.text = String(0)
    }
    
    func calcAverageBPM () {
        let sum : Double = tIntervalArray.reduce(0,+)
        let averageInterval : Double = sum / Double(tIntervalArray.count)
        print("sum is  \(sum)")
        print("averageInterval is \(averageInterval)")
        avgBPM = 60/averageInterval
    }
    
    func timeInterval() {
        let interval : Double = abs(time2 - time1)
        tInterval = interval
        return ()
    }
    
}

