//
//  ArticleView.swift
//  StocksApp
//
//  Created by connor dong on 2021-05-03.
//

import SwiftUI
import URLImage

struct ArticleView: View {
    
    let article: Article
    
    var body: some View {
        HStack {
            if let imgURL = article.urlToImage,
               let url = URL(string: imgURL) {
                
                URLImage(url: url,
                              options: URLImageOptions(
                                identifier: article.id.uuidString,
                                cachePolicy:
                                    .returnCacheElseLoad(cacheDelay: nil, downloadDelay : 0.25)
                                ),
                              failure: {error, _ in
                                PlaceHolderImageView()
                              },
                              content: { image in image.resizable().aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                              }).frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/).cornerRadius(10)
            }else {
                PlaceHolderImageView()
            }
            VStack(alignment: .leading, spacing: 4) {
                Text(article.title ?? "").foregroundColor(.black).font(.system(size: 18, weight: .semibold))
                Text(article.source?.name ?? "N/A").foregroundColor(.gray).font(.footnote)
            }
        }
    }
}

struct PlaceHolderImageView : View {
    var body: some View {
        Image(systemName: "photo.fill").foregroundColor(.white).background(Color.gray).frame(width : 100, height: 100)
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(article: Article.DummyData)
    }
}
