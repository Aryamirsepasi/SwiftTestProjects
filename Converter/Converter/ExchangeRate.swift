//
//  ExchangeRate.swift
//  Converter
//
//  Created by Arya Mirsepasi on 03.08.25.
//
import SwiftUI


struct ExchangeRate: View {
    
    let leftCurrencyIcon : String
    let rightCurrencyIcon : String
    let exchangeRate : String
    
    var body: some View {
        HStack{
            // Left Currency
            Image(systemName: leftCurrencyIcon)
                .font(.system(size: 25))
                .foregroundStyle(.green)
            
            
            // Exchange Rate Text
            Text(exchangeRate)
            
            
            // Right Currency
            
            Image(systemName: rightCurrencyIcon)
                .font(.system(size: 25))
                .foregroundStyle(.blue)
        }
    }
}

#Preview {
    ExchangeRate(leftCurrencyIcon: "dollarsign.circle.fill", rightCurrencyIcon: "eurosign.circle.fill", exchangeRate: "1 USD = 0.85 EUR")
}
