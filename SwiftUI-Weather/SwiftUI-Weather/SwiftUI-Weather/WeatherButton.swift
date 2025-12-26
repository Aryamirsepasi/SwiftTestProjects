//
//  WeatherButton.swift
//  SwiftUI-Weather
//
//  Created by Arya Mirsepasi on 11.06.25.
//

import SwiftUI

struct WeatherButton: View {
    
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    @Binding var isNight: Bool

    var body: some View {
        Button{
            isNight.toggle()
            
        } label: {
            Text(title)
                .frame(width: 280, height: 50)
                .background(backgroundColor.gradient)
                .foregroundColor(textColor)
                .font(.system(size: 20, weight: .medium, design: .default))
                .cornerRadius(15)
                
        }
    }
}
