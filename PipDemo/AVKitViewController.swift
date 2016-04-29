//
//  AVKitViewController.swift
//  PipDemo
//
//  Created by QiuFeng on 4/29/16.
//  Copyright © 2016 www.qiufeng.me. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class AVKitViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension AVKitViewController {
    
    @IBAction func mediaButtonTouchUpInside(sender: UIButton) {
        let playerViewController = AVPlayerViewController()
        if let fileUrl = NSBundle.mainBundle().URLForResource("video.mov", withExtension: nil) {
            playerViewController.player = AVPlayer(URL: fileUrl)
            playerViewController.player?.play()
        }
        playerViewController.allowsPictureInPicturePlayback = true
        playerViewController.delegate = self
        presentViewController(playerViewController, animated: true, completion: nil)
    
    }
}

extension AVKitViewController: AVPlayerViewControllerDelegate {
    func playerViewController(playerViewController: AVPlayerViewController, restoreUserInterfaceForPictureInPictureStopWithCompletionHandler completionHandler: (Bool) -> Void) {
        navigationController?.presentViewController(playerViewController, animated: false) {
            completionHandler(true)
        }
    }
}


