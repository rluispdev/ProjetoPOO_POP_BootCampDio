import UIKit

// MARK: - Protocolo para Veículos
// Define as características comuns para diferentes tipos de veículos
protocol Veiculo {
    var marca: String { get }
    var modelo: String { get }
    func descricao() -> String
}

// MARK: - Structs para Tipos de Veículos
// Carro implementa o protocolo Veiculo
struct Carro: Veiculo {
    let marca: String
    let modelo: String
    let portas: Int

    func descricao() -> String {
        return "Carro: \(marca) \(modelo) com \(portas) portas."
    }
}

// Moto implementa o protocolo Veiculo
struct Moto: Veiculo {
    let marca: String
    let modelo: String
    let cilindradas: Int

    func descricao() -> String {
        return "Moto: \(marca) \(modelo) com \(cilindradas)cc."
    }
}

// MARK: - Enum para Tipos de Combustível
// Representa os diferentes tipos de combustíveis
enum Combustivel: String {
    case gasolina = "Gasolina"
    case diesel = "Diesel"
    case eletrico = "Elétrico"
}

// MARK: - Classe Frota de Veículos
// Gerencia uma coleção de veículos
class Frota {
    private var veiculos: [Veiculo] = []

    // Adiciona um veículo à frota
    func adicionarVeiculo(_ veiculo: Veiculo) {
        veiculos.append(veiculo)
    }

    // Lista todos os veículos da frota
    func listarVeiculos() {
        for veiculo in veiculos {
            print(veiculo.descricao())
        }
    }

    // Filtra veículos por tipo sem usar closure
    func filtrarCarros() -> [Carro] {
        var carros: [Carro] = []
        for veiculo in veiculos {
            if let carro = veiculo as? Carro {
                carros.append(carro)
            }
        }
        return carros
    }

    func filtrarMotos() -> [Moto] {
        var motos: [Moto] = []
        for veiculo in veiculos {
            if let moto = veiculo as? Moto {
                motos.append(moto)
            }
        }
        return motos
    }
}

// MARK: - Uso da Frota e Veículos
let frota = Frota()

// Criando veículos
let carro1 = Carro(marca: "Toyota", modelo: "Corolla", portas: 4)
let carro2 = Carro(marca: "Honda", modelo: "Civic", portas: 4)
let moto1 = Moto(marca: "Yamaha", modelo: "R3", cilindradas: 300)

// Adicionando veículos à frota
frota.adicionarVeiculo(carro1)
frota.adicionarVeiculo(carro2)
frota.adicionarVeiculo(moto1)

// Listando veículos
print("Veículos na frota:")
frota.listarVeiculos()

// Filtrando apenas carros
let carros = frota.filtrarCarros()
print("\nCarros na frota:")
for carro in carros {
    print(carro.descricao())
}

// Filtrando apenas motos
let motos = frota.filtrarMotos()
print("\nMotos na frota:")
for moto in motos {
    print(moto.descricao())
}
