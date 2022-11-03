//
//  SingleSampleView.swift
//  StrangeWords
//
//  Created by 马英伦 on 2022/11/3.
//

import ASCollectionView_SwiftUI
import SwiftUI

struct SingleSectionExampleView: View
{
    @State var dataExample = (0 ..< 1000000).map { $0 }
    
    var body: some View
    {
        ASCollectionView(data: dataExample, dataID: \.self)
        { item, _ in
            Color.blue
                .overlay(Text("\(item)"))
        }
        .layout
        {
            .grid(
                layoutMode: .adaptive(withMinItemSize: 100),
                itemSpacing: 5,
                lineSpacing: 5,
                itemSize: .absolute(50))
        }
    }
}
