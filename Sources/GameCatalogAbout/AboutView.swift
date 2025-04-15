//
//  AboutView.swift
//  GameCatalogAbout
//
//  Created by ben on 15/04/25.
//

import SwiftUI

public struct AboutView: View {
    // Customizable properties
    private let profileImageURL: URL?
    private let name: String
    private let role: String
    private let email: String
    private let website: String
    private let location: String
    private let navigationTitle: String
    private let backgroundColor: Color
    private let textColor: Color
    private let subtitleColor: Color
    private let accentColor: Color
    
    public init(
        profileImageURL: URL? = nil,
        name: String = "Diki Haryadi",
        role: String = "iOS Developer",
        email: String = "unpam.dik@gmail.com",
        website: String = "github.com/diki-haryadi",
        location: String = "Jakarta, Indonesia",
        navigationTitle: String = "About Developer",
        backgroundColor: Color = .white,
        textColor: Color = .white,
        subtitleColor: Color = .gray,
        accentColor: Color = .blue
    ) {
        self.profileImageURL = profileImageURL
        self.name = name
        self.role = role
        self.email = email
        self.website = website
        self.location = location
        self.navigationTitle = navigationTitle
        self.backgroundColor = backgroundColor
        self.textColor = textColor
        self.subtitleColor = subtitleColor
        self.accentColor = accentColor
    }
    
    public var body: some View {
        VStack(spacing: 20) {
            AsyncImage(url: profileImageURL) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                        .cornerRadius(12)
                case .failure(_):
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(subtitleColor)
                @unknown default:
                    EmptyView()
                }
            }
            .padding(.horizontal)
            
            Text(name)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(textColor)
            
            Text(role)
                .font(.headline)
                .foregroundColor(subtitleColor)
            
            VStack(alignment: .leading, spacing: 10) {
                InfoRow(icon: "envelope.fill", text: email, accentColor: accentColor, textColor: .black)
                InfoRow(icon: "link", text: website, accentColor: accentColor, textColor: .black)
                InfoRow(icon: "location.fill", text: location, accentColor: accentColor, textColor: .black)
            }
            .padding(.top)
            
            Spacer()
        }
        .padding()
        .background(backgroundColor.edgesIgnoringSafeArea(.all))
        .navigationTitle(navigationTitle)
    }
}
