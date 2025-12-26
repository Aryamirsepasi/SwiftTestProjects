//
//  SelectCurrency.swift
//  Converter
//
//  Created by Arya Mirsepasi on 03.08.25.
//
import SwiftUI


struct IconGrid: View {
        
    @Binding var selectedCurrency: Currency
    
    
    var body: some View {
        
        // Currency Icons
        LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]){
            ForEach(Currency.allCases) { index in
                
                if selectedCurrency == index {
                    
                    CurrencyIcon(currecyImage: index.image, currencyText: index.name)
                        .shadow(color: .black, radius: 5)
                        .overlay{
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.blue, lineWidth: 2)
                                .opacity(0.5)
                        }
                } else {
                    CurrencyIcon(currecyImage: index.image, currencyText: index.name)
                        .onTapGesture {
                            selectedCurrency = index
                        }
                }
            }
        }
        
    }
}
    
    #Preview {
        @Previewable @State var selectedCurrency: Currency = .euro
        
        IconGrid(selectedCurrency: $selectedCurrency)
    }
