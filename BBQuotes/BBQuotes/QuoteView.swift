//
//  QuoteView.swift
//  BBQuotes
//
//  Created by Arya Mirsepasi on 18.12.25.
//


import SwiftUI

struct QuoteView: View {
    
    let vm = ViewModel()
    
    let show: String
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image(show.lowercased().replacingOccurrences(of: " ", with: ""))
                    .resizable()
                    .frame(width: geometry.size.width * 2.7, height: geometry.size.height * 1.2)
                
                VStack {
                    
                    VStack {
                        Spacer(minLength: 60)
                        
                        switch vm.status {
                        case .notStarted:
                            EmptyView()
                        case .fetching:
                            ProgressView()
                        case .success:
                            Text("\"\(vm.quote.quote)\"")
                                .minimumScaleFactor(0.5)
                                .multilineTextAlignment(.center)
                                .foregroundStyle(.white)
                                .padding()
                                .background(Color.black.opacity(0.7))
                                .clipShape(.rect(cornerRadius: 30))
                                .padding(.horizontal)
                            
                            ZStack(alignment: .bottom) {
                                AsyncImage(url: vm.character.images[0]) { image in
                                    image
                                        .resizable()
                                        .scaledToFill()
                                    
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: geometry.size.width/1.1, height: geometry.size.height/1.8)
                                
                                Text(vm.quote.character)
                                    .foregroundStyle(.white)
                                    .padding(10)
                                    .frame(maxWidth: .infinity)
                                    .glassEffect(.clear)
                            }
                            .frame(width: geometry.size.width/1.1, height: geometry.size.height/1.8)
                            .clipShape(.rect(cornerRadius: 30))
                            
                        case .failed(let error):
                            Text(error.localizedDescription)
                        }
                        
                        
                        Spacer()
                    }
                    
                    Button{
                        Task {
                            await vm.getData(for: show)
                        }
                    } label: {
                        Text("Get Random Quote")
                        .font(.title)
                        .foregroundStyle(.white)
                        .padding()
                        .glassEffect(.regular.tint(.bbGreen))
                        .shadow(color: .bbYellow, radius: 2)
                    }
                    
                    Spacer(minLength: 95)
                    
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    QuoteView(show: "Breaking Bad")
        .preferredColorScheme(.dark)
}
