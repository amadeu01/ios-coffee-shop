#  Como esse projeto funciona?
Estou me baseando em dois projetos [Rails coffee shop](https://github.com/marinalimeira/rails-coffee-shop) e [Kickstarter iOS](https://github.com/kickstarter/ios-oss)
A ideia é fazer um app simples para gerenciar o estoque de um Coffee Shop.

### Funcionalidades:
- Listagem de Produtos
- Adicionar um item ao estoque
- Atualizar a quantidade em estoque (Compra realizada - Baixa manual)


## Tutorial
Para adicionar e/ou implementar uma feature, siga os seguintes passos:
- 1. Faça um teste com a feature que queres implementar.
- 2. Crie um novo playground pages com a tela da feature nova.
- 3. Adicione ao projeto :smile:

## How to run
Clone the project

```bash
git clone https://github.com/amadeu01/ios-coffee-shop.git Coffee-shop
cd Coffee-shop
open Beer\ List.xcodeproj
```

### Playground

If you want to check out some stuff, you could go to playground and see the Views and play around. However, first, check if you had already built the Coffee_Shop.playground.

If you want to try something new or just check something, you could go to `_ScratchWork` and check some of the code. Or, try new implementations of something.

You can also change the 'device' view or orientation on playground by changing the enum.

```swift

public enum Device { // Type of devices
case phone3_5inch
case phone4inch
case phone4_7inch
case phone5_5inch
case pad
case pad12_9inch
}

public enum Orientation { // Orientations
case portrait
case landscape
}

```

```swift

let (parent, _) = playgroundControllers(device: .phone4inch, orientation: .portrait, child: navigationController)

```
