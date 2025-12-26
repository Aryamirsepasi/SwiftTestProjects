//
//  ExchangeInfo.swift
//  Converter
//
//  Created by Arya Mirsepasi on 03.08.25.
//

import SwiftUI

struct ExchangeInfo: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
       
        ZStack{
            
            // Background Color
            Color.gray.opacity(0.2)
                .ignoresSafeArea()
                
            
            VStack{
                // Title Text
                Text("Exchange Rates")
                    .font(.largeTitle)
                    
                
                // Description Text
                Text("Exchange rates for the selected currencies. Tap on the rates to copy them. You can also use the search bar to find specific currencies. Tap 'Done' to close this view.")
                    .font(.title3)
                    .padding()
                
                // Exchange Rates
                ExchangeRate(leftCurrencyIcon: "dollarsign.circle.fill", rightCurrencyIcon: "eurosign.circle.fill", exchangeRate: "1 USD = 0.86 EUR")
                
                ExchangeRate(leftCurrencyIcon: "sterlingsign.circle.fill", rightCurrencyIcon: "eurosign.circle.fill", exchangeRate: "1 GBP = 1.15 EUR")
                
                ExchangeRate(leftCurrencyIcon: "francsign.circle.fill", rightCurrencyIcon: "eurosign.circle.fill", exchangeRate: "1 CHF = 1.07 EUR")
                
                ExchangeRate(leftCurrencyIcon: "bitcoinsign.circle.fill", rightCurrencyIcon: "eurosign.circle.fill", exchangeRate: "1 BTC = 98414.96 EUR")
                
                // Done Button
                Button("Done") {
                    dismiss()
                        
                }
                .buttonStyle(.glassProminent)
                .font(.title2)
                .padding()
            }
        }
    }
}

#Preview {
    ExchangeInfo()
}


