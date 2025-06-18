//
//  CoreDataController.swift
//  CoreDataProducts
//
//  Created by João Vitor Rocha Miranda on 16/06/25.
//

import Foundation
import CoreData

class CoreDataController: ObservableObject{
    static let shared = CoreDataController()
    
    let persistentContainer: NSPersistentContainer
    var viewContext: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "BancoVendas")
        
        persistentContainer.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Could not load CoreData stack: \(error.localizedDescription)")
            }
            
        }
    }
    
    /*Save after changing the content*/
    func saveContext() {
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch {
                print("Error saving context: \(error.localizedDescription)")
            }
        }
    }
    
    /*Create Product*/
    func createProduct(nomeProduto: String, preco: Double, quantidade: Double, dataCompra: Date ) -> Produto {
        
        let produto = Produto(context: viewContext)
        
        produto.id = UUID() // Func nativa que cria um uuid
        produto.nomeProduto = nomeProduto
        produto.preco = preco
        produto.quantidade = quantidade
        
        saveContext()
        return produto
    }
    
    /*Search for products*/
    func fetchAllProducts() -> [Produto] {
        let fetchRequest: NSFetchRequest<Produto> = Produto.fetchRequest()
        
        do {
            let result = try viewContext.fetch(fetchRequest)
            saveContext()
            return result
        } catch {
            print("Error fetching Products: \(error.localizedDescription)")
            return []
        }
    }
    
    /*Delete Produtct*/
    func deleteProduct(_ product: Produto){
        viewContext.delete(product)
        saveContext()
    }
    
    //MARK: - Sell Funcions
    
    func createSell(_ product: Produto) -> Venda {
        let sell = Venda(context: viewContext)
        
        sell.id = UUID()
        sell.idProduto = product.id
        sell.dataVenda = Date.now.onlyDate
            
        saveContext()
        print(sell)
        return sell
    }
    
    func fetchAllSells() -> [Venda]{
        let fetchRequest: NSFetchRequest<Venda> = Venda.fetchRequest()
        
        do {
            let resultSell = try viewContext.fetch(fetchRequest)
            saveContext()
            return resultSell
        } catch {
            print("Error fetching Products: \(error.localizedDescription)")
            return []
        }
    }
    
    
}
