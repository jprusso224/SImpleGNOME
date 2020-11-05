//
//  TimeSignaturePicker.swift
//  SimpleGNOME
//
//  Created by John Paul Russo on 10/25/20.
//

import SwiftUI

struct TimeSignaturePicker: View {
    
    let PICKER_WIDTH: CGFloat = 100
    let PICKER_HEIGHT: CGFloat = 30
    
    @Binding var timeSignature: TimeSignature
    
    var body: some View {
        HStack
        {
            Picker(selection: $timeSignature.numerator, label: /*@START_MENU_TOKEN@*/Text("Picker")/*@END_MENU_TOKEN@*/, content: /*@START_MENU_TOKEN@*/
            {
                ForEach(timeSignature.VALID_NUMERATORS, id: \.self) { validTimeSig in
                    Text("\(validTimeSig)").foregroundColor(Color.white).font(.title).bold()
                }
            }/*@END_MENU_TOKEN@*/)
                .frame(width: PICKER_WIDTH, height: PICKER_HEIGHT, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).clipped()
                .background(Color.purple)
            
            Text("/").foregroundColor(.purple).bold().font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            
            Picker(selection: $timeSignature.denominator, label: /*@START_MENU_TOKEN@*/Text("Picker")/*@END_MENU_TOKEN@*/, content: /*@START_MENU_TOKEN@*/
            {
                ForEach(timeSignature.VALID_DENOMINATORS, id: \.self) { validBeatLength in
                    Text("\(validBeatLength)").foregroundColor(Color.white).font(.title).bold()
                }
            }/*@END_MENU_TOKEN@*/)
                .frame(width: PICKER_WIDTH, height: PICKER_HEIGHT, alignment: .center).clipped()
                .background(Color.purple)
        }
    }
}

struct TImeSignaturePicker_PreviewWrapper: View{
    @State private var timeSignature = TimeSignature()
    
    var body: some View {
        TimeSignaturePicker(timeSignature: $timeSignature)
    }
}

struct TimeSignaturePicker_Previews: PreviewProvider {
    
    static var previews: some View {
        TImeSignaturePicker_PreviewWrapper()
    }
}
