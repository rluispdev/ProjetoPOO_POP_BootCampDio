import UIKit
// Programação orientada a objetos

// MARK: - Enum para Prioridade de Tarefa
// Representa diferentes níveis de prioridade que uma tarefa pode ter
enum Prioridade: String {
    case baixa = "Baixa"
    case media = "Média"
    case alta = "Alta"
}

// MARK: - Struct para Tarefa
// Define a estrutura de uma Tarefa com título, prioridade e status
struct Tarefa {
    let titulo: String
    let prioridade: Prioridade
    var concluida: Bool
}

// MARK: - Classe Gerenciador de Tarefas
// Classe responsável por gerenciar uma lista de tarefas
class GerenciadorDeTarefas {
    private var tarefas: [Tarefa] = []

    // Função para adicionar uma nova tarefa
    func adicionarTarefa(titulo: String, prioridade: Prioridade) {
        let novaTarefa = Tarefa(titulo: titulo, prioridade: prioridade, concluida: false)
        tarefas.append(novaTarefa)
    }

    // Função para listar todas as tarefas
    func listarTarefas() {
        for tarefa in tarefas {
            print("- \(tarefa.titulo) [\(tarefa.prioridade.rawValue)] - \(tarefa.concluida ? "Concluída" : "Pendente")")
        }
    }

    // Função para marcar uma tarefa como concluída
    func concluirTarefa(titulo: String) {
        if let index = tarefas.firstIndex(where: { $0.titulo == titulo }) {
            tarefas[index].concluida = true
        } else {
            print("Tarefa não encontrada!")
        }
    }
}

// MARK: - Uso do GerenciadorDeTarefas
let gerenciador = GerenciadorDeTarefas()

// Adicionando tarefas
gerenciador.adicionarTarefa(titulo: "Ler livro de Swift", prioridade: .alta)
gerenciador.adicionarTarefa(titulo: "Comprar mantimentos", prioridade: .media)

// Listando tarefas
print("Tarefas:")
gerenciador.listarTarefas()

// Concluindo uma tarefa
gerenciador.concluirTarefa(titulo: "Ler livro de Swift")

// Listando tarefas novamente
print("\nTarefas após conclusão:")
gerenciador.listarTarefas()
