//
//  PlayPauseButtonStyle.swift
//  SimpleGNOME
//
//  Created by John Paul Russo on 10/25/20.
//
import SwiftUI

struct PlayPauseButtonStyle: ButtonStyle
{
    let INNER_CIRCLE_FRAME_WIDTH: CGFloat = 75.0
    let INNER_CIRCLE_FRAME_HEIGHT: CGFloat = 100.0
    let OUTER_CIRCLE_FRAME_WIDTH: CGFloat = 85.0
    let OUTER_CIRCLE_FRAME_HEIGHT: CGFloat = 100.0
    let OUTER_CIRCLE_LINE_WIDTH: CGFloat = 4.0
    let OUTER_CIRCLE_PRESSED_LINE_WIDTH: CGFloat = 2.0
    
    let UNITY_SCALE: CGSize = CGSize(width: 1.0, height: 1.0)
    let PRESSED_SCALE: CGSize = CGSize(width: 1.1, height: 1.1)
    
    let PAUSED_IMAGE_NAME: String = "pause.fill"
    let PLAY_IMAGE_NAME: String = "play.fill"
    
    let NOMINAL_COLOR: Color = Color.purple
    let PRESSED_COLOR: Color = Color.white
    
    @Binding var isPlaying: Bool
    
    func makeBody(configuration: Self.Configuration) -> some View
    {
        ZStack
        {
            Circle()
                .fill(configuration.isPressed ? PRESSED_COLOR : NOMINAL_COLOR)
                .frame(width: INNER_CIRCLE_FRAME_WIDTH, height: INNER_CIRCLE_FRAME_HEIGHT, alignment: .center)
            
            Image(systemName: self.isPlaying ? PAUSED_IMAGE_NAME : PLAY_IMAGE_NAME)
                .foregroundColor(configuration.isPressed ? NOMINAL_COLOR : PRESSED_COLOR)
            
            Circle()
                .stroke(NOMINAL_COLOR,
                        lineWidth: configuration.isPressed ?
                            OUTER_CIRCLE_PRESSED_LINE_WIDTH : OUTER_CIRCLE_LINE_WIDTH)
                .frame(width: OUTER_CIRCLE_FRAME_WIDTH, height: OUTER_CIRCLE_FRAME_HEIGHT, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .scaleEffect(configuration.isPressed ? PRESSED_SCALE : UNITY_SCALE)
        }
    }
}

struct PlayPauseButtonStyle_PreviewViewWrapper: View
{
    @State private var isPlaying: Bool = false
    
    var body: some View
    {
        Button(action:
                {
                    isPlaying = !isPlaying
                })
        {
            //None
        }
        .buttonStyle(PlayPauseButtonStyle(isPlaying: $isPlaying))
    }
}

struct PlayPauseButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        PlayPauseButtonStyle_PreviewViewWrapper()
    }
}
