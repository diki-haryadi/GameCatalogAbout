//
//  InfoRow.swift
//  GameCatalogAbout
//
//  Created by ben on 15/04/25.
//

import SwiftUI

struct InfoRow: View {
    let icon: String
    let text: String
    let accentColor: Color
    let textColor: Color
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(accentColor)
                .frame(width: 25)
            Text(text)
                .foregroundColor(textColor)
        }
    }
}
