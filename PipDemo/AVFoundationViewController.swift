//
//  AVFoundationViewController.swift
//  PipDemo
//
//  Created by QiuFeng on 4/29/16.
//  Copyright © 2016 www.qiufeng.me. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class AVFoundationViewController: UIViewController {
    
    var playerLayer: AVPlayerLayer?
    var avPictureInPictureConctroller: AVPictureInPictureController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        playerLayer?.frame = view.bounds
    }


}

extension AVFoundationViewController {
    
    @IBAction func mediaButtonTouchUpInside(sender: AnyObject) {
        if let fileUrl = NSBundle.mainBundle().URLForResource("video.mov", withExtension: nil) {
            playerLayer?.removeFromSuperlayer()
            let player = AVPlayer(URL: fileUrl)
            playerLayer = AVPlayerLayer(player: player)
            playerLayer?.videoGravity = AVLayerVideoGravityResizeAspect
            playerLayer?.frame = view.bounds
            if  AVPictureInPictureController.isPictureInPictureSupported() {
                avPictureInPictureConctroller = AVPictureInPictureController(playerLayer: playerLayer!)
                avPictureInPictureConctroller?.delegate = self
            }
            player.play()
            view.layer.addSublayer(playerLayer!)
        }
    }
}

extension AVFoundationViewController {
    
    @IBAction func startPipBarButtonTouchUpInside(sender: AnyObject) {
        if let avPictureInPictureConctroller = avPictureInPictureConctroller where !avPictureInPictureConctroller.pictureInPictureActive {
            avPictureInPictureConctroller.startPictureInPicture()
        }
    }
}

extension AVFoundationViewController: AVPictureInPictureControllerDelegate {
    func pictureInPictureControllerWillStartPictureInPicture(pictureInPictureController: AVPictureInPictureController) {
        playerLayer?.hidden = true
    }
    
    func pictureInPictureController(pictureInPictureController: AVPictureInPictureController, restoreUserInterfaceForPictureInPictureStopWithCompletionHandler completionHandler: (Bool) -> Void) {
        playerLayer?.hidden = false
        completionHandler(true)
    }
}