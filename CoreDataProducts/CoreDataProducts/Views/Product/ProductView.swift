import SwiftUI

//MARK: - Create Component that displays in the list
struct ProductView: View {
    @ObservedObject public var product: Produto
    @ObservedObject var viewModel = ContentViewModel()
    
    
    var body: some View {
        Grid (alignment: .leading) {
            HStack (){
                Text(product.nomeProduto ?? "No name found.")
                    .font(.title3)
                    .bold()
                    .padding(.top, 0.5)
                Spacer()
            }
            Divider()
            Text("Estoque: \(product.quantidade, specifier: "%.0f")")
                .font(.callout)
                .padding(.bottom, 0.5)
                .padding(.top)
            Text("Preço de Compra: R$\(product.preco, specifier: "%.2f")")
                .font(.callout)
                .padding(.bottom, 0.5)
            Divider()
//            Controls Sell log
            Stepper("Nova Venda: ", onIncrement: {
                viewModel.createSell(product)
            }, onDecrement: {
                print("TODO")

            })
            .padding(.top)
            .padding(.bottom, 0.5)
        }
        .onAppear(){
            viewModel.getProduct()
        }
    }
}

