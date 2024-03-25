//
//  RaceListItem.swift
//  F1Service
//
//  Created by Wishi on 17.03.2024.
//

import SwiftUI

struct RaceListItem: View {
    var img_url : String = ""
    var circiut_name: String = ""
    var country: String = ""
    var date : String = ""
    
    var body: some View {
            HStack {
                RaceListImageView(url: img_url)
                Spacer(minLength: 12)
                RaceListInfoLayer(circiut_name: circiut_name,country: country,date: date )
        }.frame(maxWidth: .infinity, maxHeight: 100)
            .background(Color("Grey"))
            .cornerRadius(12)
            .padding(.leading,20)
            .padding(.trailing,20)
    }
}


struct RaceListImageView: View {
    var url: String = ""
    var body: some View {
        AsyncImage(url: URL(string: url)) { phase in
            switch phase {
             case .empty:
                 ProgressView() // Display a loading indicator
             case .success(let image):
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 64,height: 64)
             case .failure(let error):
                 Text("Error loading image: \(error.localizedDescription)")
             }
        }.background(Color.white)
            .frame(width: 72,height: 72)
            .cornerRadius(16)
            .padding(.leading,8)
            .padding(.top,4)
            .padding(.bottom,4)
    }
}

struct RaceListInfoLayer: View {
    var circiut_name: String = ""
    var country: String = ""
    var date : String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(circiut_name).font(.custom("KumbhSans-Regular", size: 18))
            Text(country).font(.custom("KumbhSans-Regular", size: 12))
            Text(date).font(.custom("KumbhSans-Regular", size: 12))
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    RaceListItem()
}
