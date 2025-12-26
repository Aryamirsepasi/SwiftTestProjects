//
//  CurrencyTip.swift
//  Converter
//
//  Created by Arya Mirsepasi on 24.09.25.
//

import TipKit

struct CurrencyTip: Tip {
    var title = Text("Change Currency")
    
    var message : Text? = Text("Tap on the currency icons to select different currencies for conversion.")
    
    var image : Image? = Image(systemName: "hand.tap.fill")
    
}

