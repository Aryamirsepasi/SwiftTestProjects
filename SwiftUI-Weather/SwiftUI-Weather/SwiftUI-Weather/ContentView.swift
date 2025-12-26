//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Arya Mirsepasi on 10.06.25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)

            VStack {
                
                CityTextView(cityName: "Hamburg, DE")

                MainWeatherView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 16)
                
                HStack(spacing: 20) {
                    
                    WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 13)
                    
                    WeatherDayView(dayOfWeek: "WED", imageName: "wind", temperature: 11)

                    WeatherDayView(dayOfWeek: "THU", imageName: "sun.max.fill", temperature: 15)

                    WeatherDayView(dayOfWeek: "FRI", imageName: "sunset.fill", temperature: 13)

                    WeatherDayView(dayOfWeek: "SAT", imageName: "cloud.heavyrain.fill", temperature: 10)

                    
                }
                
                Spacer()
                
                WeatherButton(title: "Change Day Time", textColor: .white, backgroundColor: .blue, isNight: $isNight)
                
                Spacer()

            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 20, weight: .medium, design: .default))
                .foregroundColor(.white)
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
            
            Text("\(temperature)°")
                .font(.system(size: 30, weight: .medium, design: .default))
                .foregroundColor(.white)
            
        }
    }
}

struct BackgroundView: View {
    
    var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : .lightBlue]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea()
    }
}

struct CityTextView: View {
    
    var cityName: String
    
    var body: some View{
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)

            Text("\(temperature)°")
                .font(Font.system(size: 70, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}
