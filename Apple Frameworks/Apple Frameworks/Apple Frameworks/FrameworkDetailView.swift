//
//  FrameworkDetailView.swift
//  Apple Frameworks
//
//  Created by Arya Mirsepasi on 31.07.25.
//

import Foundation
import SwiftUI

struct FrameworkDetailView: View {
    
    var framework: Framework
    
    var body: some View {
        VStack{
            Spacer()
            
            FrameworkTitleView(framework: framework)
            
            Text(framework.description)
                .font(.body)
            .padding()
            
            Spacer()
            
            Button{
                
            } label: {
                AFButton(title: "Learn More")
            }
        }
    }
}

#Preview {
    FrameworkDetailView(framework: MockData.sampleFramework)
}
