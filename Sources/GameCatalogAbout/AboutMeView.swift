//
//  AboutMeView.swift
//  GameCatalogAbout
//
//  Created by ben on 15/04/25.
//

import SwiftUI

public struct AboutMeView: View {
    // Simplified configuration struct
    public struct Configuration {
        let imageURL: URL?
        let name: String
        let role: String
        let email: String
        let website: String
        let location: String
        let darkMode: Bool
        
        public init(
            imageURL: URL? = nil,
            name: String = "Diki Haryadi",
            role: String = "iOS Developer",
            email: String = "unpam.dik@gmail.com",
            website: String = "github.com/diki-haryadi",
            location: String = "Jakarta, Indonesia",
            darkMode: Bool = false
        ) {
            self.imageURL = imageURL
            self.name = name
            self.role = role
            self.email = email
            self.website = website
            self.location = location
            self.darkMode = darkMode
        }
    }
    
    private let config: Configuration
    
    public init(config: Configuration = Configuration()) {
        self.config = config
    }
    
    public var body: some View {
        NavigationView {
            AboutView(
                profileImageURL: config.imageURL,
                name: config.name,
                role: config.role,
                email: config.email,
                website: config.website,
                location: config.location,
                backgroundColor: config.darkMode ? .black : .white,
                textColor: config.darkMode ? .white : .black,
                subtitleColor: .gray,
                accentColor: .blue
            )
        }
        .preferredColorScheme(config.darkMode ? .dark : .light)
    }
}
