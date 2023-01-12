//
//  AboutDeveloperView.swift
//  Just Diary
//
//  Created by Alexander Manzurov on 07.01.2023.
//

import SwiftUI

struct AboutDeveloperView: View {
    
    @Environment(\.dismiss) var dismiss
    
    private let iconSize = CGFloat(48)

    var body: some View {
        NavigationView {
            VStack{
                Image(R.imageName.manzickAvatar)
                    .resizable()
                    .frame(width: 250, height: 250)
                    .cornerRadius(125)
                    .padding(.bottom, -10)
                
                Text("Manzick")
                    .font(.system(size: 36, weight: .semibold))
                    .padding(.bottom, 1)
                
                HStack{
                    Link(destination: URL(string: R.string.link.manzickTwitterLink)!) {
                        Image(R.imageName.twitterLogo)
                            .resizable()
                            .frame(width: iconSize, height: iconSize)
                    }
                    
                    Link(destination: URL(string: R.string.link.manzickTelegramLink)!) {
                        Image(R.imageName.telegramLogo)
                            .resizable()
                            .frame(width: iconSize, height: iconSize)
                    }
                }
                    .padding(.bottom, 1)
                
                
                Button(action: {
                    print()
                    //TODO: Добавить ссылку на гитхаб
                }) {
                    Text(R.string.aboutDeveloper.sourceButton)
                }
                
                Spacer()
            }
            .navigationTitle(R.string.aboutDeveloper.title)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    JustCloseToolbar(close: {
                        self.dismiss()
                    })
                }
        }
    }
}

struct AboutDeveloperView_Previews: PreviewProvider {
    static var previews: some View {
        AboutDeveloperView()
    }
}

