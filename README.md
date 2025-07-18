![Logo do projeto](resource/images/roboImg.png)

# Automação Mobile com Robot Framework - TED App

Este projeto é uma base de automação de testes para o aplicativo móvel TED, utilizando Robot Framework e Appium. Ele demonstra a aplicação de boas práticas como o padrão Page Object, externalização de locators e criação de keywords customizadas para testes mobile robustos.



## Tecnologias Utilizadas

*   **Robot Framework**: Framework de automação de testes.
*   **AppiumLibrary**: Biblioteca do Robot Framework para automação de aplicativos móveis (Android e iOS).
*   **Python**: Linguagem de programação.
*   **Poetry**: Ferramenta para gerenciamento de dependências e pacotes Python.
*   **PyYAML**: Biblioteca para manipulação de arquivos YAML (utilizada para os locators).

## Pré-requisitos

Antes de começar, certifique-se de ter os seguintes softwares instalados:

*   **Python 3.13+**: [Download Python](https://www.python.org/downloads/)
*   **Java Development Kit (JDK)**: Necessário para o Appium. [Download JDK](https://www.oracle.com/java/technologies/downloads/)
*   **Node.js e npm**: Necessário para instalar o Appium Server. [Download Node.js](https://nodejs.org/en/download/)
*   **Android SDK (com ADB configurado)**: Para automação Android. Pode ser instalado via Android Studio.
*   **Appium Server**:
    ```bash
    npm install -g appium
    ```
*   **Appium Doctor (Opcional, mas recomendado)**: Para verificar se todas as dependências do Appium estão configuradas corretamente.
    ```bash
    npm install -g appium-doctor
    appium-doctor
    ```

## Configuração do Projeto

1.  **Clone o repositório (se aplicável):**
    ```bash
    git clone <URL_DO_SEU_REPOSITORIO>
    cd base_rf
    ```

2.  **Instale o Poetry:**
    Se você ainda não tem o Poetry instalado:
    ```bash
    pip install poetry
    ```

3.  **Instale as dependências do projeto:**
    Navegue até o diretório raiz do projeto (`base_rf`) e execute:
    ```bash
    poetry install
    ```

4.  **Inicie o Appium Server:**
    Em um terminal separado, inicie o servidor Appium:
    ```bash
    appium -pa wd/hub
    ```
    Certifique-se de que o servidor Appium esteja rodando na porta padrão (4723) ou configure a porta no seu código, se necessário.

5.  **Configure um Emulador Android ou Conecte um Dispositivo Físico:**
    Certifique-se de que um emulador Android esteja rodando ou um dispositivo físico esteja conectado e reconhecido pelo ADB (`adb devices`).

## Estrutura do Projeto

*   `base.resource`: Arquivo de recursos principal que importa todas as bibliotecas, variáveis de locators e recursos de páginas.
*   `poetry.lock`: Gerado pelo Poetry, trava as versões exatas das dependências.
*   `pyproject.toml`: Configuração do projeto e gerenciamento de dependências via Poetry.
*   `log/`: Diretório para os logs de execução do Robot Framework.
*   `resource/`: Contém os recursos de automação.
    *   `app/`: Contém o arquivo `.apk` do aplicativo TED.
    *   `locators/`: Arquivos YAML com os seletores de elementos (locators) organizados por tela.
    *   `pages/`: Arquivos de recursos que implementam o padrão Page Object, contendo keywords para interações específicas de cada tela.
    *   `utils/`: Contém keywords customizadas e utilitários gerais para a automação.
*   `test/`: Contém os arquivos de teste do Robot Framework.
    *   `TED.robot`: O arquivo de teste principal com os cenários de teste.

## Como Rodar os Testes

1.  Certifique-se de que o **Appium Server** esteja rodando.
2.  Certifique-se de que um **emulador/dispositivo Android** esteja configurado e online.
3.  No diretório raiz do projeto (`base_rf`), execute os testes usando o Poetry:
    ```bash
    poetry run robot -d results/ test/TED.robot
    ```

### Rodar Testes Específicos por Tag

Você pode rodar testes específicos usando tags (definidas nos casos de teste):

```bash
poetry run robot -d results/ -i c2 test/TED.robot
```

## Relatórios de Teste

Após a execução dos testes, os relatórios HTML e XML serão gerados no diretório `log/`.

*   `log/report.html`: Relatório de alto nível com o resumo da execução.
*   `log/log.html`: Relatório detalhado com todos os passos e logs da execução.

## Contribuição

Sinta-se à vontade para contribuir com melhorias, correções de bugs ou novos recursos.
