# devtools-java
Shell Script para instalar ferramentas de desenvolvimento no Linux(Ubuntu)<br>

## Principais ferramentas Java Back-end

1. Docker
2. Docker Compose
3. Git
   - Instala ou atualiza para última versão
4. AWS CLI
5. SDK Man
   - Java 8, 11 e 17
6. JetBrains ToolBox
   - Para facilitar a instalação das ferramentas da JetBrains
7. Postman
8. DBeaver CE
9. VSCode
10. Oh My Zsh (Terminal)
    - Terminal ZSH
    - OhMyZsh
    - Tema Powerlevel10k
    - Fonte MesloLGS

## Como instalar

1. Clone o repositório
   ```sh
   git clone https://github.com/marcosfalves/devtools-java.git
   ```
2. Abra o diretório e execute o script
    ```sh
    cd devtools-java
   ./devtools.sh
   ```
3. Digitar a opção 99 para instalar tudo
4. Para instalar alguma ferramenta especifica:
    - Executar a opção 0 para atualizar os pacotes.
    - Depois executar novamente e digitar o código correspondente a ferramenta.
5. Para melhor aparência do terminal OhMyZsh, após a instalação ajustar os terminais para utilizar a fonte MesloLGS, instruções:

- **GNOME Terminal** (terminal padrão do Ubuntu): Abrir *Terminal → Preferences* e clique no perfil em uso em *Profiles*. Marque *Custom font* em *Text Appearance* e selecione `MesloLGS NF Regular`.

- **Visual Studio Code**: Abrir *File → Preferences → Settings* (PC) ou *Code → Preferences → Settings* (Mac), digite `terminal.integrated.fontFamily` na caixa de pesquisa na parte superior da guia *Settings* e defina o valor abaixo como `MesloLGS NF`. Consulte [esta captura de tela](https://raw.githubusercontent.com/romkatv/powerlevel10k-media/389133fb8c9a2347929a23702ce3039aacc46c3d/visual-studio-code-font-settings.jpg) para ver como deve ser ou consulte [essa issue](https://github.com/romkatv/powerlevel10k/issues/671) para obter informações adicionais.

- **IntelliJ** (e outras IDEs da JetBrains): Abrir *IDE → Edit → Preferences → Editor → Color Scheme → Console Font*. Selecione *Use console font instead of the default* e defina o nome da fonte para `MesloLGS NF`.