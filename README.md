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

- **GNOME Terminal** (the default Ubuntu terminal): Open *Terminal → Preferences* and click on the selected profile under *Profiles*. Check *Custom font* under *Text Appearance* and select `MesloLGS NF Regular`.

- **Visual Studio Code**: Open *File → Preferences → Settings* (PC) or *Code → Preferences → Settings* (Mac), enter `terminal.integrated.fontFamily` in the search box at the top of *Settings* tab and set the value below to `MesloLGS NF`. Consult [this screenshot](https://raw.githubusercontent.com/romkatv/powerlevel10k-media/389133fb8c9a2347929a23702ce3039aacc46c3d/visual-studio-code-font-settings.jpg) to see how it should look like or see [this issue](https://github.com/romkatv/powerlevel10k/issues/671) for extra information.

- **IntelliJ** (and other IDEs by Jet Brains): Open *IDE → Edit → Preferences → Editor → Color Scheme → Console Font*. Select *Use console font instead of the default* and set the font name to `MesloLGS NF`.