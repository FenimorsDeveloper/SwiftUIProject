//
//  SVGImageLoader.swift
//  SwiftUIProject
//
//  Created by Vlad Andrieiev on 25.04.2023.
//

import SVGKit

final class SVGImageLoader {
    func loadImage(with url: URL, completion: @escaping (UIImage?) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let imageData = data, let svgImage = SVGKImage(data: imageData) else {
                completion(nil)
                return
            }

            completion(svgImage.uiImage)
        }
        .resume()
    }
}
