//
//  Profile.swift
//  SwiftUIDemo
//
//  Created by Evgeniy Darnopykh on 9/25/25.
//

import SwiftUI

struct Profile: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack {
            AvatarView(image: Image("Avatar"))
            TitleBlock(title: "John Doe", role: "Musician")
            Bio(biography: """
                John Doe, born John Nommenson Duchac on February 25, 1953, is an American singer-songwriter and actor, best known as a co-founder and the male singer/bassist of the influential Los Angeles punk band X. He has released multiple solo records, appeared in over 50 films and television shows, and has a long career spanning rock, country, and folk music
                """)
            Spacer()
            ProfileButton(title: "Хорошо",
                          action: {
                dismiss()
            })
        }
    }
}

// MARK: - Avatar view

extension Profile {
    struct AvatarView: View {
        enum Constants {
            static let height: CGFloat = 96
            static let width: CGFloat = 120
            static let cornerRadius: CGFloat = 12
        }
        
        let image: Image
        
        var body: some View {
            image
                .resizable()
                .scaledToFill()
                .frame(width: Constants.width, height: Constants.height)
                .clipShape(RoundedRectangle(cornerRadius: Constants.cornerRadius))
                .overlay(
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .stroke(.gray.opacity(0.35), lineWidth: 1)
                )
                .shadow(radius: 8, x: 0, y: 3)
        }
    }
}

// MARK: - Title Block

extension Profile {
    struct TitleBlock: View {
        let title: String
        let role: String
        
        var body: some View {
            VStack(spacing: 16) {
                Text(title)
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.primary)
                
                Text(role)
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(.primary)
            }
        }
    }
}

// MARK: - Bio

extension Profile {
    struct Bio: View {
        let biography: String
        
        var body: some View {
            VStack(spacing: 16) {
                Text(biography)
                    .font(.caption)
                    .bold()
                    .padding(.horizontal, 16)
                    .foregroundColor(.primary)
            }
        }
    }
}

// MARK: - Button

struct ProfileButton: View {
    let title: String
    let action: () -> Void
    var isLoading: Bool = false
    var isFullWidth: Bool = true

    var body: some View {
        Button(action: action) {
            HStack(spacing: 8) {
                if isLoading {
                    ProgressView()
                        .progressViewStyle(.circular)
                }
                Text(title)
                    .font(.headline)
                    .lineLimit(1)
            }
            .frame(maxWidth: isFullWidth ? .infinity : nil, minHeight: 44)
        }
        .buttonStyle(ProfileButtonStyle())
        .padding(.horizontal, 16) // внешние горизонтальные отступы от супервью
        .disabled(isLoading) // при лоадинге блокируем нажатие
        .accessibilityLabel(title)
    }
    
    /// Визуальный стиль с реакцией на нажатие/disabled
    struct ProfileButtonStyle: ButtonStyle {
        @Environment(\.isEnabled) private var isEnabled

        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .padding(.horizontal, 16)
                .padding(.vertical, 10)
                .foregroundStyle(.white)
                .background(
                    Capsule()
                        .fill(isEnabled ? Color.accentColor : Color.accentColor.opacity(0.45))
                )
                .overlay(
                    Capsule()
                        .stroke(.white.opacity(0.15), lineWidth: 1)
                )
                .shadow(radius: configuration.isPressed ? 2 : 6, x: 0, y: configuration.isPressed ? 1 : 3)
                .opacity(configuration.isPressed ? 0.92 : 1.0)
                .scaleEffect(configuration.isPressed ? 0.98 : 1.0)
                .animation(.spring(response: 0.25, dampingFraction: 0.8), value: configuration.isPressed)
        }
    }
}
