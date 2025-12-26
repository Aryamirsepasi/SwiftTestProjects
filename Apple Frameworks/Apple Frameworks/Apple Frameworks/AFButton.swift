//
//  AFButton.swift
//  Apple Frameworks
//
//  Created by Arya Mirsepasi on 31.07.25.
//

import SwiftUI

struct AFButton: View {
    
    var title: String
    
    var body: some View {
        Text(title)
        .font(.title2)
        .frame(width: 150, height: 40)
        .background(Color.blue)
        .foregroundStyle(Color.white)
        .cornerRadius(30)
    }
}

#Preview {
    AFButton(title: "Learn More")
}
