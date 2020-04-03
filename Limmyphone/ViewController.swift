//
//  ViewController.swift
//  Limmyphone
//
//  Created by Mark Robson on 03/04/2020.
//  Copyright © 2020 Mark Robson. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player: AVAudioPlayer!
    let sounds = ["you", "are", "a", "fucking", "cunt"]
    var currentSound = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func nextSound () {
        if currentSound == sounds.count - 1 {
            currentSound = 0
        } else {
            currentSound += 1
        }
    }

    @IBAction func playNote(_ sender: UIButton) {
        playSound(sender.currentTitle!)
    }
    
    func playSound(_ note: String) {
        let url = Bundle.main.url(forResource: sounds[currentSound], withExtension: "mp3", subdirectory: note)
          player = try! AVAudioPlayer(contentsOf: url!)
          player.play()
          nextSound()
    }
}

