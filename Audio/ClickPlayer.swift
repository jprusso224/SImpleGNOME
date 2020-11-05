//
//  ClickPlayer.swift
//  SimpleGNOME
//
//  Created by John Paul Russo on 10/30/20.
//

import AVFoundation

class ClickPlayer
{
    var audioPlayer: AVAudioPlayer? = nil
    
    init(audioFileName: String)
    {
        loadAudioFiles(fileName: audioFileName)
    }
    
    private func loadAudioFiles(fileName: String)
    {
        let path = Bundle.main.path(forResource: fileName, ofType: nil)!
        let url = URL(fileURLWithPath: path)
        
        do
        {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.prepareToPlay()
        }
        catch
        {
            //Couldn't load file
        }
    }
    
    func play()
    {
        audioPlayer?.currentTime = 0.0
        audioPlayer?.play()
    }
    
    func pause()
    {
        audioPlayer?.pause()
        audioPlayer?.currentTime = 0.0
    }
}
