//
//  Holder.swift
//  F1Service
//
//  Created by Wishi on 31.12.2023.
//

import SwiftUI

struct Holder: View {
    var img: String = ""
    var gradientState: Bool = true
    var body: some View {
        ZStack() {
            HolderImage(img: img)
            if (gradientState) {
                HolderGradientBackground()
            }
            
        }.frame(maxWidth: .infinity, maxHeight: 150)
            .background(Color("Grey"))
    }
}

struct HolderImage: View {
    var img = ""
    var body: some View {
        HStack {
            Spacer(minLength: 120)
            AsyncImage(url: URL(string: img)) { phase in
                switch phase {
                 case .empty:
                     ProgressView() // Display a loading indicator
                 case .success(let image):
                     image // Display the loaded image
                 case .failure(let error):
                     Text("Error loading image: \(error.localizedDescription)")
                 }
            }
        }
        .frame(width: .infinity,height: 150)
        .cornerRadius(15)
    }
}

struct HolderGradientBackground: View {
    
    let gradient = Gradient(stops: [
        .init(color: Color("StartGradient"), location: 0),  // Start color at 0%
        .init(color: Color("CenterGradient"), location: 0.53),   // Center color at 50%
        .init(color: Color("EndGradient"), location: 1)   // End color at 100%
    ])
        
    var body: some View {
        Rectangle()
           .fill(LinearGradient(gradient: gradient, startPoint: .leading, endPoint: .trailing))

    }
}


#Preview {
    Holder()
}
