//
//  BpmControlSliderView.swift
//  SimpleGNOME
//
//  Created by John Paul Russo on 10/25/20.
//

import SwiftUI

struct BpmControlSliderView: View {
    
    var minValue: CGFloat = 20
    var maxValue: CGFloat = 221
    var radius: CGFloat = 130
    var radiusControl: CGFloat = 15
    @State var angleValue: CGFloat = 180.0
    
    @Binding var bpm: Int
    
    var body: some View {
        ZStack
        {
            Circle()
                .stroke(Color.purple, lineWidth: 2.0)
                .frame(width: 2*radius, height: 2*radius)
            Circle()
                .fill(Color.purple)
                .frame(width: 2*radiusControl, height: 2*radiusControl)
                .padding(10)
                .offset(y: -radius)
                .rotationEffect(Angle.degrees(Double(angleValue)))
                .gesture(DragGesture(minimumDistance: 0.0)
                            .onChanged(
                                {
                                    value in
                                    change(location: value.location)
                                }))
            VStack{
                Text("\(Int(bpm))").font(.largeTitle)
            }
        }
    }
    
    private func change(location: CGPoint)
    {
        // creating vector from location point
        let vector = CGVector(dx: location.x, dy: location.y)
        
        // geting angle in radian need to subtract the knob radius and padding from the dy and dx
        let angle = atan2(vector.dy - (radiusControl + 10), vector.dx - (radiusControl + 10)) + .pi/2
        
        // convert angle range from (-pi to pi) to (0 to 2pi)
        let fixedAngle = angle < 0.0 ? angle + 2.0 * .pi : angle
        
        // convert angle value to temperature value
        bpm = Int(minValue + fixedAngle / (2.0 * .pi) * (maxValue - minValue))
        
        angleValue = fixedAngle * 180 / .pi // converting to degree
    }
}

struct BpmControlSliderView_PreviewWrapper: View {
    
    @State var bpm: Int = 120
    
    var body: some View
    {
        VStack
        {
            BpmControlSliderView(bpm: $bpm).padding()
        }
    }
}

struct CircularSliderView_Previews: PreviewProvider {
    static var previews: some View {
        BpmControlSliderView_PreviewWrapper()
    }
}
