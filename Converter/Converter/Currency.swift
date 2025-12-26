//
//  Currency.swift
//  Converter
//
//  Created by Arya Mirsepasi on 06.08.25.
//

import SwiftUI

enum Currency: Double, CaseIterable, Identifiable {
    
    case euro = 1.0
    case usd = 1.16
    case gbp = 0.8713
    case btc = 0.000010163991
    case chf = 0.94

    var id: Currency { self }

    var image: String {
        switch self {
        case .euro:
            return "eurosign.circle.fill"
        case .usd:
            return "dollarsign.circle.fill"
        case .gbp:
            return "sterlingsign.circle.fill"
        case .btc:
            return "bitcoinsign.circle.fill"
        case .chf:
            return "francsign.circle.fill"
        }
    }

    var name: String {
        switch self {
        case .euro:
            return "EUR"
        case .usd:
            return "USD"
        case .gbp:
            return "GBP"
        case .btc:
            return "BTC"
        case .chf:
            return "CHF"
        }
    }
    
    func convert(amountString: String, currency: Currency) -> String {
        guard let amount = Double(amountString) else { return "" }
        
        let convertedAmount = (amount / self.rawValue) * currency.rawValue 
        
        return String(format: "%.2f", convertedAmount)
    }

}
