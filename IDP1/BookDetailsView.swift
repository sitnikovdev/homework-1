//
//  BookDetailsView.swift
//  IDP1
//
//  Created by Oleg Sitnikov on 17.12.24.
//

import SwiftUI


struct BookDetailsView: View {
    var book: Book

    var body: some View {
        VStack {
            Text(book.author)
                .font(.caption)
            Text(book.title)
                .font(.title)
            Text(book.description)
                .font(.system(size: 96))
        }
        .padding()
    }
}
