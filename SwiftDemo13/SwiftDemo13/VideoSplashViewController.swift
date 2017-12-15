//
//  VideoSplashViewController.swift
//  SwiftDemo13
//
//  Created by jiaoyu on 2017/12/15.
//  Copyright © 2017年 viewhigh. All rights reserved.
//

import UIKit
import MediaPlayer
import AVKit

public enum ScalingMode {
    case Resize
    case ResizeAspect
    case ResizeAspectFill
}

public class VideoSplashViewController: UIViewController {
    
    private let moviePlayer = AVPlayerViewController()
    private var moviePlayerSoundLevel:CGFloat = 1.0
    public var contentURL: NSURL = NSURL() {
        didSet {
            
        }
        
    }
    
    public var videoFrame: CGRect = CGRect()
    public var startTime: CGFloat = 0.0
    public var duration:CGFloat = 0.0
    public var backgroundColor: UIColor = UIColor.black{
        didSet {
            view.backgroundColor = backgroundColor
        }
    }
    
    public var sound: Bool = true {
        didSet {
            if sound {
                moviePlayerSoundLevel = 1.0
            }else{
                moviePlayerSoundLevel = 0.0
            }
        }
    }

    public var alpha: CGFloat = CGFloat() {
        didSet {
            moviePlayer.view.alpha = alpha
        }
    }
    
    public var alwaysRepeat: Bool = true {
        didSet{
            if alwaysRepeat {
                NotificationCenter.default.addObserver(self, selector: #selector(VideoSplashViewController.playerItemDidReachEnd), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: moviePlayer.player?.currentItem)
            }
        }
    }
    
    public var fillMode: ScalingMode = .ResizeAspectFill {
        didSet{
            switch fillMode {
            case .Resize:
                moviePlayer.videoGravity = AVLayerVideoGravity.resize.rawValue
            case .ResizeAspect:
                moviePlayer.videoGravity = AVLayerVideoGravity.resizeAspect.rawValue
            case .ResizeAspectFill:
                moviePlayer.videoGravity = AVLayerVideoGravity.resizeAspectFill.rawValue
            }
        }
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        moviePlayer.view.frame = videoFrame
        moviePlayer.showsPlaybackControls = false
        view.addSubview(moviePlayer.view)
        view.sendSubview(toBack: moviePlayer.view)
    }
    public override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    private func setMoviePlayer(url: NSURL){
        let videoCutter = VideoCutter()
        videoCutter.cropVideoWithUrl(videoUrl: url, startTime: startTime, duration: duration) { (videoPath, error) in
            if let path = videoPath as NSURL? {
                self.moviePlayer.player = AVPlayer(url: path as URL)
                self.moviePlayer.player?.play()
                self.moviePlayer.player?.volume = Float(self.moviePlayerSoundLevel)
            }
        }
    }
    override public func viewDidLoad() {
        super.viewDidLoad()


    
    }

    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func playerItemDidReachEnd() {
        moviePlayer.player?.seek(to: kCMTimeZero)
        moviePlayer.player?.play()
    }

}
