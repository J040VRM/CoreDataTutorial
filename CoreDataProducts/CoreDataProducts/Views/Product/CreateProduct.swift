import SwiftUI

struct CreateProduct: View {
    @StateObject var viewModel: ContentViewModel //Acessaremos a viewModel que sera passada como parametro quando chamarmos a view.
    
    @Environment(\.dismiss) var dismiss
    
    /*Products Atributes*/
    @State var nomeProduto: String = ""
    @State var preco: Double = 0
    @State var quantidade: Double = 0
    @State var dataCompra: Date = Date.now.onlyDate
    
    var body: some View {
        NavigationStack{

                Form {
                    /*Get user input*/
                    TextField("Nome", text: $nomeProduto)
                        .listRowSeparator(.visible)

                    HStack{
                        Text("Estoque:       ")
                        TextField("", value: $quantidade, format: .number)
                    }
                    .listRowSeparator(.hidden)
                    
                    HStack{
                        Text("Preço de Compra: ")
                        TextField("", value: $preco, format: .number)
                    }
                    .listRowSeparator(.hidden)
                   

                }
                .scrollContentBackground(.hidden)
   
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    /*Save Button*/
                    Button("Save") {
                        viewModel.createProduct(nomeProduto: nomeProduto, preco: preco, quantidade: quantidade, dataCompra: dataCompra)
                        dismiss()
                    }
                }
                /*Cancel Button*/
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
            .navigationTitle("Create")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}


