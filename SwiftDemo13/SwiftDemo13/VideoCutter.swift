//
//  VideoCutter.swift
//  SwiftDemo13
//
//  Created by jiaoyu on 2017/12/15.
//  Copyright © 2017年 viewhigh. All rights reserved.
//

import UIKit
import AVFoundation

extension String {
    var convert: NSString { return (self as NSString) }
}

public class VideoCutter: NSObject {
    /**
     Block based method for crop video url
     
     @param videoUrl Video url
     @param startTime The starting point of the video segments
     @param duration Total time, video length
     */
    public func cropVideoWithUrl(videoUrl url: NSURL, startTime: CGFloat, duration: CGFloat, completion: ((_ videoPath: NSURL?, _ error: NSError?) -> Void)?) {
        DispatchQueue.global().async() {
            let asset = AVURLAsset(url: url as URL, options: nil)
            let exportSession = AVAssetExportSession(asset: asset, presetName: "AVAssetExportPresetHighestQuality")
            let paths: NSArray = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as NSArray
            var outputURL = paths.object(at: 0) as! String
            let manager = FileManager.default
            do {
                try manager.createDirectory(atPath: outputURL, withIntermediateDirectories: true, attributes: nil)
            } catch _ {
            }
            outputURL = outputURL.convert.appendingPathComponent("output.mp4")
            do {
                try manager.removeItem(atPath: outputURL)
            } catch _ {
            }
            if let exportSession = exportSession as AVAssetExportSession? {
                exportSession.outputURL = NSURL(fileURLWithPath: outputURL) as URL
                exportSession.shouldOptimizeForNetworkUse = true
                exportSession.outputFileType = AVFileType.mp4
                let start = CMTimeMakeWithSeconds(Float64(startTime), 600)
                let duration = CMTimeMakeWithSeconds(Float64(duration), 600)
                let range = CMTimeRangeMake(start, duration)
                exportSession.timeRange = range
                exportSession.exportAsynchronously { () -> Void in
                    switch exportSession.status {
                    case AVAssetExportSessionStatus.completed:
                        completion?(exportSession.outputURL as NSURL?, nil)
                    case AVAssetExportSessionStatus.failed:
                        print("Failed: \(String(describing: exportSession.error))")
                    case AVAssetExportSessionStatus.cancelled:
                        print("Failed: \(String(describing: exportSession.error))")
                    default:
                        print("default case")
                    }
                }
            }
        }
    }
}
