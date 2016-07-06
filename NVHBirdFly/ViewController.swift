//
//  ViewController.swift
//  NVHBirdFly
//
//  Created by Hùng Nguyễn  on 7/4/16.
//  Copyright © 2016 MobileSoftware. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    var bird = UIImageView()
    var audioPlayer = AVAudioPlayer()
    
    let space :CGFloat = 30.0
    override func viewDidLoad() {
        super.viewDidLoad()
            drawJungle()
            addBird()
            flyUpAndDown()
            flyZigZag()
            playSong()
    }

    func drawJungle() {
        let background = UIImageView(image: UIImage(named: "haunted_forset.jpg"))
        
        background.frame = self.view.bounds
        background.contentMode = .ScaleAspectFill
        self.view.addSubview(background)
    }
   
    func addBird()  {
        bird = UIImageView(frame: CGRectMake(self.space, self.space, 100, 60))
        
        bird.animationImages = [UIImage(named:"flying_raven_animation-1 (dragged).tiff")!,
                                UIImage(named:"flying_raven_animation-2 (dragged).tiff")!,
                                UIImage(named:"flying_raven_animation-3 (dragged).tiff")!,
                                UIImage(named:"flying_raven_animation-4 (dragged).tiff")!,
                                UIImage(named:"flying_raven_animation-5 (dragged).tiff")!,
                                UIImage(named:"flying_raven_animation-6 (dragged).tiff")!,
                                UIImage(named:"flying_raven_animation-7 (dragged).tiff")!,
                                UIImage(named:"flying_raven_animation-8 (dragged).tiff")!,
                                UIImage(named:"flying_raven_animation-9 (dragged).tiff")!
                                
        ]
        bird.animationRepeatCount = 0
        bird.animationDuration = 2.5
        bird.startAnimating()
        self.view.addSubview(bird)
    }
    
    func flyUpAndDown() {
        UIView.animateWithDuration(5, animations: {
            // code
            self.bird.center = CGPointMake(self.view.bounds.size.width - self.space, self.view.bounds.size.height - self.space)
        }) {(finished) in
            self.bird.transform = CGAffineTransformConcat(CGAffineTransformScale(self.bird.transform, -1, 1), CGAffineTransformMakeRotation(0))
            
            UIView.animateWithDuration(3, animations: {
            self.bird.center = CGPointMake(self.space , self.view.bounds.size.height - self.space)

            }) {(finished) in
                self.bird.transform = CGAffineTransformConcat(CGAffineTransformScale(self.bird.transform, -1, 1), CGAffineTransformMakeRotation(-120))
                
                UIView.animateWithDuration(5, animations: {
                   self.bird.center = CGPointMake(self.view.bounds.size.width - self.space , self.space)
                }) {(finished) in
                    self.bird.transform = CGAffineTransformConcat(CGAffineTransformScale(self.bird.transform, -1, 1), CGAffineTransformMakeRotation(120))
                    
                    UIView.animateWithDuration(3, animations: {
                        self.bird.center = CGPointMake(self.space, self.space)
                    }) {(finished) in
                        self.bird.transform = CGAffineTransformConcat(CGAffineTransformScale(self.bird.transform, -1, 1), CGAffineTransformMakeRotation(0))
                       // self.flyUpAndDown()
                        self.flyZigZag()
                    }
                    
                }
            }
        }
    }
    
    
    func flyZigZag()  {
        UIView.animateWithDuration(2, animations: {
            self.bird.center = CGPointMake(self.view.bounds.size.width - self.space, self.view.bounds.size.height / 4)
        }) {(finished) in
            self.bird.transform = CGAffineTransformConcat(CGAffineTransformScale(self.bird.transform, -1.1, 1), CGAffineTransformMakeRotation(0))
            
            UIView.animateWithDuration(2, animations: {
                self.bird.center = CGPointMake(self.space, self.view.bounds.size.height / 2)
            }) {(finished) in
                    self.bird.transform = CGAffineTransformConcat(CGAffineTransformScale(self.bird.transform, -1.2, 1), CGAffineTransformMakeRotation(0))
                
                    UIView.animateWithDuration(2, animations: {
                        self.bird.center = CGPointMake(self.view.bounds.size.width - self.space, self.view.bounds.size.height * 3/4)
                    }) {(finished) in
                       self.bird.transform = CGAffineTransformConcat(CGAffineTransformScale(self.bird.transform, -1.3, 1), CGAffineTransformMakeRotation(0))
                        
                        UIView.animateWithDuration(2, animations: {
                            self.bird.center = CGPointMake(self.space, self.view.bounds.size.height - self.space)
                        }) {(finished) in
                            self.bird.transform = CGAffineTransformConcat(CGAffineTransformScale(self.bird.transform, -1, 1), CGAffineTransformMakeRotation(0))
                            
                            UIView.animateWithDuration(2, animations: {
                                self.bird.center = CGPointMake(self.view.bounds.size.width - self.space, self.view.bounds.size.height - self.space)
                            }) {(finished) in
                               self.bird.transform = CGAffineTransformConcat(CGAffineTransformScale(self.bird.transform, -0.8, 1), CGAffineTransformMakeRotation(0))
                                
                                UIView.animateWithDuration(2, animations: {
                                    self.bird.center = CGPointMake(self.space, self.view.bounds.size.height / 2)
                                }) {(finished) in
                                    self.bird.transform = CGAffineTransformConcat(CGAffineTransformScale(self.bird.transform, -0.7, 1), CGAffineTransformMakeRotation(0))
                                    
                                    UIView.animateWithDuration(2, animations: {
                                        self.bird.center = CGPointMake(self.view.bounds.size.width - self.space, self.space)
                                    }) {(finished) in
                                        self.bird.transform = CGAffineTransformConcat(CGAffineTransformScale(self.bird.transform, -1, 1), CGAffineTransformMakeRotation(0))
                                        UIView.animateWithDuration(2, animations: {
                                            self.bird.center = CGPointMake(self.space, self.space)
                                        }) {(finished) in
                                            self.bird.transform = CGAffineTransformConcat(CGAffineTransformScale(self.bird.transform, -1.2, 1), CGAffineTransformMakeRotation(0))
                                            self.flyZigZag()
                                        }
                                    }
                                
                                }
                            }
                        }
                }
                
            }
        }
    }
    
    func playSong() {
        let filePath = NSBundle.mainBundle().pathForResource("TiengChimCuGay-V.A-3768761", ofType: ".mp3")
        
        let url = NSURL(fileURLWithPath: filePath!)
        
        audioPlayer = try! AVAudioPlayer(contentsOfURL: url)
        audioPlayer.prepareToPlay()
        audioPlayer.play()
        
        
    }
}

