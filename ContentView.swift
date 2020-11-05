//
//  ContentView.swift
//  SimpleGNOME
//
//  Created by John Paul Russo on 10/25/20.
//

import SwiftUI

struct ContentView: View
{
    @State private var isPlaying: Bool = false
    @State var metronome = Metronome()
    
    var body: some View {
        VStack
        {
            Text("SimpleGNOME").font(.largeTitle).bold().padding(.top)
            Text("Metronome").font(.subheadline)

            BpmControlSliderView(bpm: $metronome.bpm).padding().zIndex(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
            
            TimeSignaturePicker(timeSignature: $metronome.timeSignature)
                .padding()
            
            Button(action:
                    {
                        if(!isPlaying)
                        {
                            metronome.start()
                        }
                        else
                        {
                            metronome.stop()
                        }
                        
                        isPlaying = !isPlaying
                    })
            {
                //N/A
            }
            .buttonStyle(PlayPauseButtonStyle(isPlaying: $isPlaying))
        
        }.ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
