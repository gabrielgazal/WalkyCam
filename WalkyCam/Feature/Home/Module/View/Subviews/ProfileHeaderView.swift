//
//  ProfileHeaderView.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 16/10/23.
//

import SwiftUI

struct ProfileHeaderView: View {

    private var name: String
    private var imageURL: URL?
    private var actions: Actions

    // MARK: - Inner Types

    public struct Actions {
        let chatAction: (() -> Void)?
        let notificationsAction: (() -> Void)?
        let profileAction: (() -> Void)?
        public init(
            chatAction: (() -> Void)? = nil,
            notificationsAction: (() -> Void)? = nil,
            profileAction: (() -> Void)? = nil
        ) {
            self.chatAction = chatAction
            self.notificationsAction = notificationsAction
            self.profileAction = profileAction
        }
    }

    // MARK: - Initialization

    public init(name: String,
                imageURL: URL?,
                actions: ProfileHeaderView.Actions = .init()) {
        self.name = name
        self.imageURL = imageURL
        self.actions = actions
    }

    // MARK: - Dependencies

    var body: some View {
        HStack(alignment: .center,
               spacing: Tokens.Size.Spacing.regular) {
            Text(L10n.HomeView.Profile.hello(name))
                .font(.projectFont(size: Tokens.Size.Font.large, weight: .bold))
                .foregroundColor(.negro)
            Spacer()
            Image(Asset.Icons.mail.name)
                .resizable()
                .frame(width: Tokens.Size.Font.xlarge, height: Tokens.Size.Font.xlarge)
                .onTapGesture {
                    actions.chatAction?()
                }
            Image(systemName: "bell.fill")
                .resizable()
                .frame(width: Tokens.Size.Font.xlarge, height: Tokens.Size.Font.xlarge)
                .onTapGesture {
                    actions.notificationsAction?()
                }
            VStack {
                if let url = imageURL {
                    AsyncImageView(imageLoadable: url) { status in
                        Group {
                            switch status {
                            case .failured:
                                placeholder
                            case .loading:
                                ProgressView()
                            default:
                                placeholder
                            }
                        }
                    }
                } else {
                    placeholder
                }
            }
            .onTapGesture {
                actions.profileAction?()
            }
            .frame(width: 48, height: 48)
            .clipped()
            .cornerRadius(24, corners: .allCorners)
        }
    }

    private var placeholder: some View {
        Image(systemName: "person.circle")
            .resizable()
            .frame(width: Tokens.Size.Font.huge, height: Tokens.Size.Font.huge)
            .scaledToFill()
    }

    // MARK: - Private methods

}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(name: "Teste", imageURL: nil)
            .padding(24)
    }
}
