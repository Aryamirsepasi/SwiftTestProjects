//
//  CurrencyIcon.swift
//  Converter
//
//  Created by Arya Mirsepasi on 03.08.25.
//
import SwiftUI


struct CurrencyIcon: View {
    
    let currecyImage: String
    let currencyText: String
    
    var body: some View {
        
        // Currency Icons
        ZStack(alignment: .bottom) {
            Image(systemName: currecyImage)
                .foregroundStyle(.white)
                .font(.system(size: 60))
            
            Text(currencyText)
                .padding(2)
                .font(.caption)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity)
                .foregroundStyle(.white)
                .glassEffect()
            
        }
        .padding(3)
        .frame(width: 80, height: 80)
        .glassEffect(in: .rect(cornerRadius: 15))
        
    }
    
    
}

#Preview {
    CurrencyIcon(currecyImage: "dollarsign.circle.fill", currencyText: "USD")
}
