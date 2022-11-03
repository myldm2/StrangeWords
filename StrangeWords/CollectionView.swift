//
//  CollectionView.swift
//  StrangeWords
//
//  Created by 马英伦 on 2022/11/3.
//

import UIKit
import SwiftUI

struct CollectionComponent : UIViewRepresentable {
    func makeCoordinator() -> CollectionComponent.Coordinator {
        Coordinator(data: [])
    }
      
    class Coordinator: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {
        var data: [String] = []
      
        init(data: [String]) {
            for index in (0...1000) {
                self.data.append("\(index)")
            }
        }
      
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            data.count
        }
      
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! GenericCell
            cell.customView.rootView = AnyView(
                Text(data[indexPath.item]).font(Font.title).border(Color.red)
            )
            return cell
        }
    }
      
      
    func makeUIView(context: Context) -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.dataSource = context.coordinator
        cv.delegate = context.coordinator
        cv.register(GenericCell.self, forCellWithReuseIdentifier: "cell")
      
        cv.backgroundColor = .white
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        return cv
    }
    
    func updateUIView(_ uiView: UICollectionView, context: Context) {
      
    }
}
      
      
open class GenericCell: UICollectionViewCell {
        public var customView = UIHostingController(rootView: AnyView(Text("")))
        public override init(frame: CGRect) {
        super.init(frame: frame)
            configure()
        }
        public required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            configure()
        }
        private func configure() {
            contentView.addSubview(customView.view)
            customView.view.preservesSuperviewLayoutMargins = false
            customView.view.translatesAutoresizingMaskIntoConstraints = false
      
        NSLayoutConstraint.activate([
            customView.view.leftAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leftAnchor),
            customView.view.rightAnchor.constraint(equalTo: contentView.layoutMarginsGuide.rightAnchor),
            customView.view.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            customView.view.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor),
            customView.view.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}
    