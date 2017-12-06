//
//  ViewController.swift
//  SwiftDemo6
//
//  Created by jiaoyu on 2017/12/6.
//  Copyright © 2017年 viewhigh. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit
import MediaPlayer

class ViewController: UIViewController {
    var audioPlayer : AVAudioPlayer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let vedioPlayer = UIButton(type: UIButtonType.custom)
        vedioPlayer.frame = CGRect(x: 50, y: 50, width: 100, height: 50)
        vedioPlayer.setTitle("Play Vidio", for: UIControlState.normal)
        vedioPlayer.setTitleColor(UIColor.blue, for: UIControlState.normal)
        self.view.addSubview(vedioPlayer)
        vedioPlayer.addTarget(self, action: #selector(playVideo), for: .touchUpInside)
        
        let audioPlayButton = UIButton(type: UIButtonType.custom)
        audioPlayButton.frame = CGRect(x: 50, y: 150, width: 100, height: 50)
        audioPlayButton.setTitleColor(UIColor.blue, for: UIControlState.normal)
        audioPlayButton.setTitle("Play Audio", for: UIControlState.normal)
        self.view.addSubview(audioPlayButton)
        audioPlayButton.addTarget(self, action: #selector(playAudio), for: .touchUpInside)
        let audioPauseButton = UIButton(type: UIButtonType.custom)
        audioPauseButton.frame = CGRect(x: 50, y: 250, width: 100, height: 50)
        audioPauseButton.setTitleColor(UIColor.red, for: UIControlState.normal)
        audioPauseButton.setTitle("Pause Audio", for: UIControlState.normal)
        self.view.addSubview(audioPauseButton)
        audioPauseButton.addTarget(self, action: #selector(pauseAudio), for: .touchUpInside)
        
        initAudio()
        UIApplication.shared.beginReceivingRemoteControlEvents()
        
    }

    
    func initAudio()  {
        let audioPath = Bundle.main.path(forResource: "live", ofType: "mp3")
        let audioUrl = URL(fileURLWithPath: audioPath!)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioUrl)
        } catch  {
            audioPlayer = nil
        }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayAndRecord)
            
            try AVAudioSession.sharedInstance().setActive(true)
        } catch  {
            print("error")
        }
        
        
    }
    
    func initForLockScreen() {
        let image:UIImage = #imageLiteral(resourceName: "thumb.jpg")
        
        let artworkImage = MPMediaItemArtwork(boundsSize: image.size) { (size) -> UIImage in
            return image
        }
        MPNowPlayingInfoCenter.default().nowPlayingInfo = [
            MPMediaItemPropertyTitle:"皇后大道东",
            MPMediaItemPropertyArtist:"罗大佑",
            MPMediaItemPropertyArtwork:artworkImage,
            MPNowPlayingInfoPropertyPlaybackRate:1.0,
            MPMediaItemPropertyPlaybackDuration:audioPlayer?.duration,
            MPNowPlayingInfoPropertyElapsedPlaybackTime:audioPlayer?.currentTime
        ]
    }
    
    
    @objc func playVideo() {
        let videoUrl = URL(string: "http://down.treney.com/mov/test.mp4")
        let player = AVPlayer(url: videoUrl!)
        let playVideoPlayController = AVPlayerViewController()
        playVideoPlayController.player = player
        self.present(playVideoPlayController, animated: true) {
            
        }
        
        
    }
    //播放
    @objc func playAudio()  {
        audioPlayer?.play()
    }
    //暂停
    @objc func pauseAudio() {
        audioPlayer?.pause()
    }
    
    override func remoteControlReceived(with event: UIEvent?) {
        switch event!.subtype {
        case .remoteControlPlay:
            audioPlayer?.play()
            
        case .remoteControlPause:
            audioPlayer?.pause()
        
        case .remoteControlStop:
            audioPlayer?.stop()
        default:
            break
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

