//
//  ViewController.swift
//  VolumeOverlayWindow
//
//  Created by Saurel on 05/09/2019.
//  Copyright (c) 2019 ryookano. All rights reserved.
//

import UIKit
import MediaPlayer
import VolumeOverlayWindow

class ViewController: UIViewController {
    var audioPlayer = AVPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        try! AVAudioSession.sharedInstance().setActive(true)
        
        let url = URL(string: "https://www.youtube.com/watch?v=ndTbiDQjbiE&list=LLF7cp0plTQ-ok7WpJ16ALbQ&index=3&t=5s")!
        audioPlayer = AVPlayer(url: url)
        audioPlayer.play()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        // It is acquired by 'viewWillLayoutSubviews' because SafedAreaInsets can not be acquired by viewdidload
        VolumeOverlay.shared.load()
    }
}

