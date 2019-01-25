//
//  ViewController.swift
//  MusicPlayer
//
//  Created by Gökçe Demir on 16.01.2019.
//  Copyright © 2019 Gökçe Demir. All rights reserved.
//

import UIKit
import MediaPlayer

class ViewController: UIViewController {

    var musicPlayer = MPMusicPlayerController.applicationMusicPlayer
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func genreButtonTapped(_ sender: UIButton) {
        MPMediaLibrary.requestAuthorization { (status) in
            if status == .authorized{
                self.playGenre(genre: sender.currentTitle!)
            }
        }
    }
    @IBAction func stopButtonTapped(_ sender: Any) {
        musicPlayer.stop()
    }
    @IBAction func nextButtonTapped(_ sender: Any) {
         musicPlayer.skipToNextItem()
    }
    func playGenre(genre:String){
        musicPlayer.stop()
        
        let query = MPMediaQuery()
        let predicate = MPMediaPropertyPredicate(value: genre, forProperty: MPMediaItemPropertyGenre)
        query.addFilterPredicate(predicate)
        
        musicPlayer.setQueue(with: query)
        musicPlayer.shuffleMode = .songs
        musicPlayer.play()
    }
}
