import SwiftUI

struct ProductListView: View {
    @StateObject var viewModel = ContentViewModel()
    @State private var showingSheet: Bool = false
    @State var searchText: String = "" // Used in Search bar
    
    var searchReults: [Produto] {
        guard !searchText.isEmpty else {
            return viewModel.products
        }
        
        return viewModel.products.filter {
            $0.nomeProduto!.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    var body: some View {
        
        NavigationStack {
            VStack {
                List(searchReults) { product in
                        Section {
                            ProductView(product: product)
                        }
                        .swipeActions {
                            Button(role: .destructive) {
                                viewModel.deleteProduct(product)
                            } label: {
                                Image(systemName: "trash")
                            }
                        }
                    
                }
                .scrollContentBackground(.hidden)
                .listStyle(.insetGrouped)
            }
            .navigationTitle("Produtos")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        showingSheet.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                    
                    .sheet(isPresented: $showingSheet, onDismiss: {
                        viewModel.getProduct()
                    }) {
                        CreateProduct(viewModel: viewModel)
                    }
                }
            }
            .onAppear {
                viewModel.getProduct()
            }
            .searchable(text: $searchText)
        }

    }
}



