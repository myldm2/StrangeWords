//
//  ArticleView.swift
//  StrangeWords
//
//  Created by 马英伦 on 2022/10/31.
//

import SwiftUI

struct ArticleView: View
{
    let message: String

    var body: some View
    {
        Text(message)
            .font(.largeTitle)
    }
}
