//
//  ImageView.swift
//  IDP1
//
//  Created by Oleg Sitnikov on 17.12.24.
//

import SwiftUI


struct ImageView: UIViewRepresentable {
    var image: UIImage?

    func makeUIView(context: Context) -> UIImageView {
       let image = UIImageView()
        image.contentMode = .scaleAspectFill
        return image
    }

    func updateUIView(_ uiView: UIImageView, context: Context) {
        uiView.image = image
    }
}
