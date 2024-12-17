//
//  ContentView.swift
//  IDP1
//
//  Created by Oleg Sitnikov on 14.12.24.
//

import SwiftUI

struct Book: Identifiable, Hashable {
    let title: String
    let author: String
    let description: String
    let id: Int = UUID().hashValue
    let selected: Bool = false
}

enum TabSelection {
    case main
    case books
    case modal
}

enum SelectedItem {
    case book(Book)
}

final class BooksListViewModel: ObservableObject {
    @Published var book: Book?
    var selectedItem = 2

    @Published var books: [Book] = [
        .init(title: "Book1", author: "Author1", description: "🧑🏻‍🌾"),
        .init(title: "Book2", author: "Author2", description: "🧀"),
        .init(title: "Book3", author: "Author3", description: "🍔"),
        .init(title: "Book4", author: "Author4", description: "☕️"),
        .init(title: "Book5", author: "Author5", description: "🧇"),
        .init(title: "Book6", author: "Author6", description: "🍅"),
        .init(title: "Book7", author: "Author7", description: "🍉"),
        .init(title: "Book8", author: "Author8", description: "🫑"),
        .init(title: "Book9", author: "Author9", description: "🌶️"),
    ]

}

struct ContentView: View {
    var body: some View {
        TabsScreen()
    }
}

struct TabsScreen: View {
    @StateObject private var booksListViewModel: BooksListViewModel = .init()
    @State private var selectedTab: TabSelection = .main
    @State private var showModal = false

    var body: some View {

        TabView(selection: $selectedTab) {
            Tab(value: .main) {
                MainTab(tabSelection: $selectedTab)
            } label: {
                Text("Tab1")
                Image(systemName: "book")
            }

            Tab(value: .books) {
                    NavigationView  {
                        BooksListView()
                                .environmentObject(booksListViewModel)
                        }
            } label: {
                Text("Tab2")
                Image(systemName: "books.vertical")
            }
            Tab(value: .modal) {
                Button("Open modal") {
                    showModal = true
                }
                .sheet(isPresented: $showModal) {
                    ModalWindow()
                        .presentationDetents([.medium])
                }

            } label: {
                Text("Tab3")
                Image(systemName: "macwindow.on.rectangle")
            }

        }
    }
}


struct MainTab: View {
    @Binding var tabSelection: TabSelection
    @EnvironmentObject var viewModel: BooksListViewModel

    var body: some View {
        Button {
            tabSelection = .books
        } label: {
            Text("📗")
                .font(.system(size: 96))
        }
    }
}

#Preview {
    ContentView()
}
