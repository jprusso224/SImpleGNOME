//
//  Metronome.swift
//  SimpleGNOME
//
//  Created by John Paul Russo on 10/30/20.
//

import Foundation

class Metronome
{
    private var primaryClick = ClickPlayer(audioFileName: "woodblock_high.wav")
    private var secondaryClick = ClickPlayer(audioFileName: "woodblock_low.wav")
    
    private var metronomeTimer: Timer? = nil
    private var beatCounter: Int = 1
    
    var bpm: Int = 120
    var timeSignature = TimeSignature()
    
    func start()
    {
        //Reset beat counter
        beatCounter = 1
        
        //Calculate time between beats.
        let timeBetweenBeats_sec: Double = 1.0 / (Double(bpm) / 60.0)
        
        //Schedule the timer to play the click on calculated interval.
        metronomeTimer = Timer.scheduledTimer(withTimeInterval: timeBetweenBeats_sec, repeats: true, block: {
            timer in
            self.playClick()
        })
        
        primaryClick.play()
    }
    
    func stop()
    {
        metronomeTimer?.invalidate()
        metronomeTimer = nil
        beatCounter = 1
    }
    
    func playClick()
    {
        //TODO: Play the audio track.
        beatCounter += 1
        
        if(beatCounter > timeSignature.numerator)
        {
            primaryClick.play()
            beatCounter = 1
        }
        else
        {
            secondaryClick.play()
        }
    }
}
