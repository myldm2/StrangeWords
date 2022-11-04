//
//  ArticleEditView.swift
//  StrangeWords
//
//  Created by 马英伦 on 2022/11/4.
//

import UIKit
import SwiftUI

struct ArticleEditView: View {
    
    @State var text = """
        Every new car release means another competitor for brands — and the industry seems to be pumping out new vehicles every day. Companies are chasing every avenue to attract customers in this competitive market. And the latest? Well, that’d be gaming.

        Besides, of course, a vehicle’s visual appeal and the joy of being in the driver’s seat, designers are focusing their attention on our overall in-car experience. This is especially the case with EVs and their time-zapping charging. Sitting in the car gets boring, and carmakers want to entertain us.

        One company entering this space is N-Dream, the Swiss startup behind the AirConsole game platform. N-Dream was inspired to create an in-car gaming experience after CEO Anthony Cliquot saw “people playing games on their phone despite a big screen in front of them” while charging their EVs.
    """
    @State var isEditing = false
    
    var body: some View {
        VStack {
            Button(action: {
//                self.isEditing.toggle()
                ArticleModule.shared.analyseArticleSync(text)
            }) {
                Text("analyse")
//                Text("\(isEditing ? "Stop" : "Start") editing")
            }
            TextView(
                text: $text,
                isEditing: $isEditing,
                placeholder: "Enter text here"
            )
        }
    }

}
