# Flatlight

Um utilitario de linha de comando rapido e interativo para gerenciar pacotes **Flatpak** utilizando **`fzf`**, focado em simplicidade, fluidez e produtividade.

![Inicial](pictures/1.png)
![Procura Aplicativo](pictures/2.png)

---

## Sobre o Projeto

O **Flatlight** nasceu da minha necessidade de tornar o gerenciamento de aplicativos Flatpak mais agil e intuitivo diretamente pelo terminal.
Em vez de lidar com comandos longos ou interfaces graficas pesadas, o Flatlight combina a velocidade dos scripts Bash com uma interface de selecao em texto rico (TUI) alimentada pelo `fzf`.

Com ele, e possivel buscar, instalar e remover multiplos aplicativos de forma simultanea e integrada ao Flathub.

---

## Principais Funcionalidades

* **Interface Interativa com `fzf`:** Navegue por uma lista limpa e organizada dos aplicativos com suporte a busca em tempo real.
* **Selecao Multipla:** Marque varios aplicativos de uma só vez usando a tecla `TAB` para processá-los em lote.
* **Alternancia Inteligente (Toggle):** A mesma interface detecta automaticamente o estado do aplicativo — se ja estiver instalado, o Flatlight realiza a remocao; caso contrario, executa a instalacao.
* **Atalhos Uteis:** Comandos integrados para selecionar (`Ctrl+A`) ou desmarcar (`Ctrl+D`) todos os itens instantaneamente.
* **Leve e Eficiente:** Escrito em Bash puro, com dependencias minimas e baixo consumo de recursos.

---

## Pre-requisitos

Para que o Flatlight funcione corretamente no seu sistema, certifique-se de ter os seguintes pacotes instalados:

* **[Flatpak](https://flatpak.org/)** (com o repositorio Flathub configurado)
* **[fzf](https://github.com/junegunn/fzf)** (Fuzzy finder para a interface interativa)

---

## Instalacao

1. Clone o repositorio ou baixe o script principal para o seu ambiente:
   ```bash
   git clone https://github.com/slackjeff/FlatLight.git
   cd flatlight
   ```
2. Torne o script executavel

```
chmod +x flatlight
```
