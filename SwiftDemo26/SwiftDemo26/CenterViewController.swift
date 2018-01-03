//
//  CenterViewController.swift
//  SwiftDemo26
//
//  Created by jiaoyu on 2018/1/3.
//  Copyright © 2018年 viewhigh. All rights reserved.
//

import UIKit
import AVFoundation

class CenterViewController: UIViewController,AVCapturePhotoCaptureDelegate {
    
    var imageView : UIImageView!
    var captureSesssion : AVCaptureSession!
    var stillImageOutput : AVCapturePhotoOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        captureSesssion = AVCaptureSession()
        captureSesssion.sessionPreset = AVCaptureSession.Preset.photo
        
        self.imageView = UIImageView(frame: self.view.bounds)
        self.view.addSubview(self.imageView)
        
        let captureBtn = UIButton()
        captureBtn.frame.size = CGSize(width: 48, height: 48)
        
        captureBtn.center.x = self.view.center.x
        captureBtn.frame.origin.y = self.view.frame.height - 100
        captureBtn.setImage(#imageLiteral(resourceName: "takePhoto"), for: UIControlState.normal)
        captureBtn.addTarget(self, action: #selector(takePhoto(sender:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(captureBtn)
        
        let device = AVCaptureDevice.default(for: .video)!
        do {
            let input = try AVCaptureDeviceInput(device: device)
            if captureSesssion.canAddInput(input) {
                captureSesssion.addInput(input)
                stillImageOutput = AVCapturePhotoOutput()
                if(captureSesssion.canAddOutput(stillImageOutput)){
                    captureSesssion.addOutput(stillImageOutput)
                    
                    let captureVedioLayer:AVCaptureVideoPreviewLayer = AVCaptureVideoPreviewLayer.init(session: captureSesssion)
                    captureVedioLayer.frame = self.imageView.bounds
                    captureVedioLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
                    self.imageView.layer.addSublayer(captureVedioLayer)
                    
                    captureSesssion.startRunning()
                }
            }
            
        } catch  {
            print(error)
        }
    }
    
    
    @objc func takePhoto(sender:UIButton) {
        DispatchQueue.main.async { [unowned self] in
            self.view.layer.opacity = 0
            
            UIView.animate(withDuration: 0.25, animations: {
                self.view.layer.opacity = 1
            })
        }
        
        let settingsForMonitorng = AVCapturePhotoSettings()
        settingsForMonitorng.flashMode = .auto
        settingsForMonitorng.isAutoStillImageStabilizationEnabled = true
        settingsForMonitorng.isHighResolutionPhotoEnabled = false
        stillImageOutput.capturePhoto(with: settingsForMonitorng, delegate: self)
        
    }
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        //图片数据
        let photoData = photo.fileDataRepresentation()
        let image = UIImage(data: photoData!)
        UIImageWriteToSavedPhotosAlbum(image!, nil, nil, nil)
    }
    
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
