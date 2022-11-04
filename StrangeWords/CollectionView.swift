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
            cell.label.text = data[indexPath.item]
            return cell
        }
    }
      
      
    func makeUIView(context: Context) -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 3
        layout.minimumLineSpacing = 5
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.dataSource = context.coordinator
        cv.delegate = context.coordinator
        cv.register(GenericCell.self, forCellWithReuseIdentifier: "cell")
      
        cv.backgroundColor = .white
    
        return cv
    }
    
    func updateUIView(_ uiView: UICollectionView, context: Context) {
      
    }
}
      
      
open class GenericCell: UICollectionViewCell {
    public let label = UILabel()
    public override init(frame: CGRect) {
    super.init(frame: frame)
        configure()
    }
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    private func configure() {
        contentView.addSubview(self.label)
        self.label.preservesSuperviewLayoutMargins = false
        self.label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.label.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            self.label.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            self.label.topAnchor.constraint(equalTo: contentView.topAnchor),
            self.label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
//            customView.view.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}
    
