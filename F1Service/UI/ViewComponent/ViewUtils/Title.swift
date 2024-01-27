//
//  Title.swift
//  F1Service
//
//  Created by Wishi on 16.01.2024.
//

import SwiftUI

/**
 This view keeps the app title and app icon for Next Race CardView
 */

struct Title: View {
    var key: String = ""
    
    var body: some View {
        HStack(spacing: 8){
            Text(key).font(.custom("KumbhSans-Light", size: 24))
                .foregroundColor(Color("PrimaryTextColor"))
                .background(Color("Transparent"))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top,30)
                .padding(.leading,30)
        }
    }
}


/**
 The view keeps the sub title of apps.
 */

struct SubTitle: View {
    var key: String = ""
    var body: some View {
        HStack(spacing: 8){
            Text(key).font(.custom("KumbhSans-Light", size: 18))
                .foregroundColor(Color("PrimaryTextColor"))
                .background(Color("Transparent"))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading,30)
        }
    }
}


#Preview {
    Title()
}
