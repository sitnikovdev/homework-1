//
//  BooksListView.swift
//  IDP1
//
//  Created by Oleg Sitnikov on 17.12.24.
//

import SwiftUI

struct BooksListView: View {
    @EnvironmentObject var viewModel: BooksListViewModel

    private var selectedBookBinding: Binding<Book?> {
         Binding(
            get: { viewModel.book },
            set: { viewModel.book = $0 }
         )
     }

    var body: some View {
        List {
            ForEach(viewModel.books) { book in
                    NavigationLink(destination: BookDetailsView(book: book),
                                   tag: book,
                                   selection: selectedBookBinding
                    ) {
                        HStack {
                            Text(book.description)
                            Text(book.title)
                        }
                        .font(.headline)
                        .padding()
                    }
            }
        }
        .padding(24)
        .onAppear {
            viewModel.book = viewModel.books[viewModel.selectedItem]
        }
    }
}


#Preview {
    BooksListView()
}
