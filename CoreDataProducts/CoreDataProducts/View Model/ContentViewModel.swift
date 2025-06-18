

import Foundation
import CoreData
import SwiftUI

class ContentViewModel: ObservableObject {
    @Published var products: [Produto] = [] // Quando formos acessar os produtos do banco, sera atravez dessa variavel, nao diretamente do banco.
    @Published var sells: [Venda] = []
    
    func getProduct() {
        products = CoreDataController.shared.fetchAllProducts()
    }
    
    func createProduct(nomeProduto: String, preco: Double, quantidade: Double, dataCompra: Date ) {
        let result = CoreDataController.shared.createProduct(nomeProduto: nomeProduto, preco: preco, quantidade: quantidade, dataCompra: dataCompra)
        
        self.products.append(result)
    }
    
    func deleteProduct(_ product: Produto) {
        CoreDataController.shared.deleteProduct(product)
    }
    
    //MARK: - Sell Functions
    
    func getSell() {
        sells = CoreDataController.shared.fetchAllSells()
    }
    
    func createSell(_ product: Produto){
        let result = CoreDataController.shared.createSell(product)
        
        self.sells.append(result)
    }

}
