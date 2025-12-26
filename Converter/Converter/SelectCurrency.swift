//
//  SelectCurrency.swift
//  Converter
//
//  Created by Arya Mirsepasi on 03.08.25.
//
import SwiftUI


struct SelectCurrency: View {
    
    @Environment(\.dismiss) var dismiss
    
    @Binding var topCurrency: Currency
    @Binding var bottomCurrency: Currency
    
    
    var body: some View {
        ZStack{
            
            // Background Color
            Color.gray.opacity(0.1)
                .ignoresSafeArea()
            
            VStack{
                
                // Text
                Text("Select Currency you are starting with:")
                    .fontWeight(.bold)

                // Currency Icons
                IconGrid(selectedCurrency: $topCurrency)
                                    
                // Text
                Text("Select Currency you would like to convert to:")
                    .fontWeight(.bold)
                    .padding(.top)
                
                // Currency Icons
                IconGrid(selectedCurrency: $bottomCurrency)

                // Done Button
                Button("Done") {
                    dismiss()
                        
                }
                .buttonStyle(.glassProminent)
                .font(.title2)
                .padding()
            }
            .padding()
            .multilineTextAlignment(.center)

            
        }
    }
}

#Preview {
    @Previewable @State var topCurrency: Currency = .euro
    @Previewable @State var bottomCurrency: Currency = .usd
    
    SelectCurrency(topCurrency: $topCurrency, bottomCurrency: $bottomCurrency)
}
