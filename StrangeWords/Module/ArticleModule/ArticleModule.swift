//
//  ArticleModule.swift
//  StrangeWords
//
//  Created by 马英伦 on 2022/11/4.
//

import UIKit

class ArticleModule: NSObject {

    static let shared = ArticleModule()
    
    func analyseArticle(_ text: String) async throws -> ArticleModel {
        await withCheckedContinuation({ continuation in
            DispatchQueue.global().async {
                continuation.resume(returning: ArticleModel())
            }
        })
    }
    
    func analyseArticleSync(_ text: String) -> ArticleModel {
        let scanner = Scanner(string: text)
        while !scanner.isAtEnd {
            let string = scanner.scanUpToCharacters(from: CharacterSet.init(charactersIn: " .,“?\n"))
            print("mayinglun log: \(String(describing: string))")
            
            if string == nil && !scanner.isAtEnd {
                scanner.scanLocation += 1
                
                if !scanner.isAtEnd {
                    let startIndex = scanner.currentIndex
                    let sep = text[startIndex...startIndex]
                    print("mayinglun log: \(sep)")
                    
                    if sep == "\n" {
                        print("mayinglun log: 换行")
                    }
                }
  
                continue
            }
            
            if !scanner.isAtEnd {
                let startIndex = scanner.currentIndex
                let sep = text[startIndex...startIndex]
                print("mayinglun log: \(sep)")
                
                if sep == "\n" {
                    print("mayinglun log: 换行")
                }
                
//                scanner.scanLocation += 1
            }
        }
        
        
        
        return ArticleModel()
    }
    
}
