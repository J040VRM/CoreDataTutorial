<div align="center">

<img width="100%" src="https://capsule-render.vercel.app/api?type=waving&color=0:FF6F61,100:6C5B7B&height=200&section=header&text=CoreData%20SwiftUI%20CRUD&fontSize=45&fontColor=fff&animation=twinkling&fontAlignY=40">

<p align="center">
  <i>📦 Aplicativo CRUD com persistência local usando CoreData e SwiftUI, incluindo cadastro, listagem, filtro e histórico de vendas de produtos.</i>
</p>

<p align="center">
  <i>📦 Local persistence CRUD app using CoreData and SwiftUI — featuring product registration, list view, filters and sales history.</i>
</p>

---

### 🌟 Features | Funcionalidades

<div align="center">

| Feature | Description                                 | Descrição                                              |
| :-----: | :------------------------------------------ | :----------------------------------------------------- |
|    🧱   | CoreData integration for persistence         | Persistência de dados com CoreData                     |
|    🖋️   | Product creation with SwiftUI form          | Cadastro de produtos com formulário SwiftUI            |
|    🧮   | Price, quantity and date management         | Controle de preço, estoque e data de compra            |
|    🔍   | Search filter for product list              | Filtro de busca por nome do produto                    |
|    🗑️   | Swipe-to-delete with confirmation           | Exclusão de itens com swipe (deslizar)                 |
|   📈   | Sales log for each product                  | Registro de vendas vinculado a produtos                |
|   🕹️   | Interactive and reactive interface          | Interface interativa e reativa com SwiftUI             |

</div>

---

### 🧰 Technologies | Tecnologias

| Tipo      | Ferramenta/Framework | Descrição                                                    |
| --------- | ---------------------| ------------------------------------------------------------- |
| 🍎 Apple | `Xcode + SwiftUI`     | Interface declarativa e construção de navegação               |
| 💽 Apple | `CoreData`            | Persistência local e modelagem de entidades relacionais       |
| 📅 Swift | `Date extension`      | Formatação personalizada de datas                            |

---

### 🛠️ Estrutura do Projeto

- `CoreDataController.swift`: gerenciamento de contexto, fetch e save
- `ContentViewModel.swift`: lógica da aplicação e comunicação com as views
- `CreateProductView.swift`: formulário para criar produtos
- `ProductListView.swift`: exibição e filtro da lista de produtos
- `ProductView.swift`: detalhes de um produto específico
- `DateComponent.swift`: extensão de formatação de datas
- `Entidades`: Produto e Venda com relacionamento um-para-muitos

---

### 🚀 Executando o Projeto

1. Clone o repositório:
```bash
git clone https://github.com/J040VRM/CoreDataTutorial.git
