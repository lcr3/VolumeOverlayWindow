//
//  VolumeView.swift
//  WorkSpace
//
//  Created by Saurel on 2019/05/03.
//  Copyright © 2019 ryookano. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer

class VolumeView: UIWindow {
    let statusBarHeight: CGFloat = 20.0
    let notchStatusBarHeight: CGFloat = 30.0
    var progressView = ProgressView()
    var defaultBackgroundColor = UIColor(red: 0.969, green: 0.969, blue: 0.969, alpha: 1.0)
    
    init() {
        let windows = UIApplication.shared.windows
        let dummyVolumeView = DummyVolumeView()
        windows.first?.addSubview(dummyVolumeView)

        let screen = UIScreen.main.bounds
        var initFrame = CGRect(x: 0.0,
                               y: -statusBarHeight,
                               width: screen.width,
                               height: statusBarHeight)
        if UIDevice.hasNotch {
            initFrame = CGRect(x: 0.0,
                               y: -statusBarHeight,
                               width: screen.width,
                               height: notchStatusBarHeight)
        }
        super.init(frame: initFrame)
        
        backgroundColor = defaultBackgroundColor
        windowLevel = UIWindowLevelStatusBar + 1
        progressView = ProgressView(windowFrame: frame)
        addSubview(progressView)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    func changeVolume(volume: Float) {
        progressView.setProgress(volume, animated: true)
    }
}

class ProgressView: UIProgressView {
    let statusBarHeight: CGFloat = 20.0
    let hasNotchY: CGFloat = 20.0
    let hasNotchWidth: CGFloat = 90.0
    
    init(windowFrame: CGRect) {
        var initFrame = CGRect(x: mergin,
                               y: windowFrame.height / 2,
                               width: windowFrame.width - mergin * 2,
                               height: statusBarHeight)
        if UIDevice.hasNotch {
            initFrame = CGRect(x: notchMergin,
                               y: hasNotchY,
                               width: hasNotchWidth - notchMergin * 2,
                               height: windowFrame.height)
        }
        super.init(frame: initFrame)
        
        progressTintColor = .black
        let volume = AVAudioSession.sharedInstance().outputVolume
        setProgress(volume, animated: false)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class DummyVolumeView: MPVolumeView {
    
    init() {
        let frame = CGRect(x: -2000.0, y: -2000.0, width: 0.0, height: 0.0)
        super.init(frame: frame)
        
        alpha = 0.1
        isUserInteractionEnabled = false
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
}
