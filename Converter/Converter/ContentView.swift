//
//  ContentView.swift
//  Converter
//
//  Created by Arya Mirsepasi on 03.08.25.
//

import SwiftUI
import TipKit

struct ContentView: View {
    @State var showExchangeInfo = false
    @State var showSelectCurrency = false
    
    @State var leftAmount = ""
    @State var rightAmount = ""
    
    @FocusState var leftTyping
    @FocusState var rightTyping
    
    @State var leftCurrency: Currency = .euro
    @State var rightCurrency: Currency = .usd
    
    let currencyTip = CurrencyTip()
    
    var body: some View {
        ZStack {
            // Background
            
            VStack {
                // Main Icon
                Image(systemName: "coloncurrencysign.bank.building.fill")
                    .foregroundStyle(Color.gray)
                    .font(.system(size: 60))
                
                // Currency Exchange Text
                Text("Currency Exchange")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(Color.gray)
                    .padding(.top, 5)
                
                Spacer()
                // Conversion Section
                HStack {
                    Spacer()
                    HStack{
                        
                        // Left conversion section
                        VStack {
                            // Currency Picker
                            HStack {
                                // Currency Image
                                Image(systemName: leftCurrency.image)
                                    .font(.system(size: 30))
                                
                                // Currency Text
                                Text(leftCurrency.name)
                                    .font(.headline)
                            }
                            .padding(.bottom, -2)
                            .onTapGesture {
                                // Show currency selection view
                                showSelectCurrency.toggle()
                                currencyTip.invalidate(reason: .actionPerformed)
                            }
                            .popoverTip(currencyTip, arrowEdge: .bottom)
                            
                            // Text Field for Amount
                            TextField("Amount", text: $leftAmount)
                                .textFieldStyle(.roundedBorder)
                                .focused($leftTyping)
                                .keyboardType(.decimalPad)
                                
                        }
                        
                        // Equals Sign
                        Image(systemName: "equal")
                            .font(.largeTitle)
                            .foregroundStyle(Color.gray)
                            .symbolEffect(.pulse)
                        
                        // Right conversion section
                        
                        VStack {
                            // Currency Picker
                            HStack {
                                // Currency Text
                                Text(rightCurrency.name)
                                    .font(.headline)
                                
                                // Currency Image
                                Image(systemName: rightCurrency.image)
                                    .font(.system(size: 30))
                            }
                            .padding(.bottom, -2)
                            .onTapGesture {
                                // Show currency selection view
                                showSelectCurrency.toggle()
                                currencyTip.invalidate(reason: .actionPerformed)
                            }
                            
                            // Text Field for Amount
                            TextField("Amount", text: $rightAmount)
                                .textFieldStyle(.roundedBorder)
                                .keyboardType(.decimalPad)
                                .multilineTextAlignment(.trailing)
                                .focused($rightTyping)
                                
                        }
                    }
                    .padding()
                    .glassEffect(in: .rect(cornerRadius: 20))
                    .keyboardType(.decimalPad)
                    
                    Spacer()
                    
                }
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    // Info Button
                    Button {
                        showExchangeInfo.toggle()
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .font(.system(size: 35))
                            .foregroundStyle(Color.gray)
                    }
                    .padding(.trailing, 20)
                }
            }
        }
        .task{
            try? await Tips.configure()
        }
        .onChange(of: leftAmount) {
            if leftTyping {
                rightAmount = leftCurrency.convert(amountString: leftAmount, currency: rightCurrency)
            }
        }
        .onChange(of: rightAmount) {
            if rightTyping {
                leftAmount = rightCurrency.convert(amountString: rightAmount, currency: leftCurrency)
            }
        }
        .onChange(of: leftCurrency){
            leftAmount = rightCurrency.convert(amountString: rightAmount, currency: leftCurrency)
        }
        .onChange(of: rightCurrency){
            rightAmount = leftCurrency.convert(amountString: leftAmount, currency: rightCurrency)
        }
        .sheet(isPresented: $showSelectCurrency) {
            SelectCurrency(topCurrency: $leftCurrency, bottomCurrency: $rightCurrency)
        }
        .sheet(isPresented: $showExchangeInfo) {
            ExchangeInfo()
        }
    }
}

#Preview {
    ContentView()
}
