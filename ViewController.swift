//
//  ViewController.swift
//  Timer.ver1
//
//  Created by Sachiko OKADA on 2019/05/12.
//  Copyright © 2019 Sachiko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var countNum = 0
    var timerRunning = false
    var timer = Timer()
    
    @IBOutlet weak var mDisplay: UILabel!
    @IBOutlet weak var sDisplay: UILabel!
    @IBOutlet weak var msDisplay: UILabel!
    
//    @IBOutlet weak var lapDisplay: UILabel!
//
//    @IBOutlet weak var mDisplay2: UILabel!
//    @IBOutlet weak var sDisplay2: UILabel!
//    @IBOutlet weak var msDisplay2: UILabel!
//
    
    @objc func updateDisplay(){
        
        countNum += 1
        
        let ms = countNum % 100
        let s = (countNum - ms) / 100 % 60
        let m = (countNum - s - ms) / 6000 % 3600
        
        let mDisplayString = String(format:"%02d", m)
        let sDisplayString = String(format:"%02d", s)
        let msDispayString = String(format:"%02d", ms)
        
        mDisplay.text = mDisplayString
        sDisplay.text = sDisplayString
        msDisplay.text = msDispayString
        
    }

    @IBAction func startBtn(_ sender: UIButton) {
        
        if timerRunning == false{
            timer = Timer.scheduledTimer(timeInterval: 0.01,
                                         target: self,
                                         selector:#selector(ViewController.updateDisplay),
                                         userInfo: nil,
                                         repeats: true)
            timerRunning = true
     }
    }
    
    @IBAction func stopBtn(_ sender: UIButton) {
        
        if timerRunning == true{
            timer.invalidate()
            timerRunning = false
     }
    }
    
    @IBAction func resetBtn(_ sender: UIButton) {
        
        countNum = 0
        mDisplay.text = "00"
        sDisplay.text = "00"
        msDisplay.text = "00"
        
    }
    
//    @IBAction func lapBtn(_ sender: UIButton) {
//
//
//
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

