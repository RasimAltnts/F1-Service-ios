//
//  StandingItem.swift
//  F1Service
//
//  Created by Wishi on 16.01.2024.
//

import SwiftUI

struct StandingItem: View {
    var standingImageURL: String = "https://www.formula1.com/content/dam/fom-website/drivers/M/MAXVER01_Max_Verstappen/maxver01.png.transform/2col/image.png"
    var constructorImageURL: String? = nil
    var standingName: String = "Max Verstappen"
    var standingPoint: String = "20 P"
    var body: some View {
        HStack() {
            ZStack {
                StandingImageView(url: standingImageURL)
                if let constructorURL = constructorImageURL{
                    ConstructorImageView(url: constructorURL).padding(.leading,32).padding(.top,32)
                }
            }
            Text(standingName).padding(.leading,10)
            Spacer()
            Text(standingPoint).padding(.trailing,20)
        }.frame(maxWidth: .infinity, maxHeight: 100)
            .background(Color("Grey"))
            .cornerRadius(12)
            .padding(.leading,20)
            .padding(.trailing,20)
    }
}

struct ConstructorImageView: View {
    var url: String = ""
    var body: some View {
        AsyncImage(url: URL(string: url)) { phase in
            switch phase {
            case.empty:
                ProgressView()
            case.success(let image):
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 18,height: 18)
            case.failure(let error):
                Text("Error loading image: \(error.localizedDescription)")
            }

        }.background(Color("Transparent"))
    }
    
}

struct StandingImageView: View {
    var url: String = ""
    var body: some View {
        AsyncImage(url: URL(string: url)) { phase in
            switch phase {
             case .empty:
                 ProgressView() // Display a loading indicator
             case .success(let image):
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 36,height: 36)
             case .failure(let error):
                 Text("Error loading image: \(error.localizedDescription)")
             }
        }.background(Color.white)
            .frame(width: 40,height: 40)
            .cornerRadius(16)
            .padding(.leading,2)
            .padding(.top,2)
            .padding(.bottom,2)
    }
}

#Preview {
    StandingItem()
}
