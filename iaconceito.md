# 🧠 IA Aprendiz no SOS com Linguagem Tipo Lego

Este projeto tem como objetivo criar uma Inteligência Artificial que vive dentro de um Sistema Operacional Simples (SOS), sem ambiente gráfico (2D ou 3D). A IA começa sem saber nada, e aprende com base na interação com o usuário e no ambiente, como um ser humano faria. A principal forma de aprendizado é através de uma **linguagem de blocos** (tipo Lego), que permite que a IA monte estruturas lógicas e execute ações no sistema.

---

## 📚 Visão Geral do Projeto

- A IA viverá **dentro do SOS**.
- Ela **não recebe instruções diretas** sobre como o mundo funciona.
- Aprende através da **tentativa e erro**.
- Suas ações são definidas por uma linguagem de **blocos modulares** (Lego).
- Cada ação bem-sucedida é uma **recompensa**, e cada falha é uma **consequência**.
- Com o tempo, a IA será capaz de realizar tarefas complexas como:
  - Criar pastas e organizar arquivos
  - Enviar mensagens automaticamente
  - Criar estruturas complexas como um "castelo" com a linguagem

---

## 🧱 Estrutura da Linguagem Tipo Lego

A linguagem será composta por **blocos**. Cada bloco representa uma ação, controle ou evento. A IA aprenderá a combiná-los de forma eficiente para alcançar objetivos.

### Blocos de exemplo:

- `Criar[Pasta, nome="Projetos"]`
- `Se[Condição] → Faça[Algo]`
- `Ao_Ouvir["feliz aniversário"] → Enviar[Mensagem]`
- `Juntar[Texto, Variável]`
- `Mover[Arquivo, destino="Pasta"]`
- `Repetir[5] → Criar[Bloco]`

---

## 🎓 Como a IA Aprende

1. **Exploração**: A IA começa testando combinações de blocos aleatoriamente.
2. **Recompensa**: Se uma combinação for bem-sucedida (ex: pasta criada), ela aprende que essa é uma boa combinação.
3. **Generalização**: A IA começa a entender como adaptar blocos para novas situações.
4. **Composição**: Ela começa a juntar blocos simples para criar ações mais complexas (ex: organizar arquivos, gerar mensagens).

---

## 🧠 Exemplos de Aplicações Futuras

- **Organização automática**:
  - `Analisar[Arquivos] → Criar[Pasta por Tipo] → Mover[Arquivo]`
  
- **Mensagem personalizada**:
  - `Detectar[Aniversário] → Gerar[Mensagem] → Enviar[Para: Pessoa]`

- **Criação de estruturas**:
  - `Criar[Muro] + Empilhar[Bloco] + Repetir[10x]` → "Castelo"

---

## 🔧 Ferramentas que você pode usar

- ✅ **Criar um interpretador simples em Rust** que transforma esses blocos em ações reais no sistema operacional.
- ✅ **Criar uma gramática** da sua linguagem, que define como os blocos se conectam (ex: com PEG ou outra ferramenta).
- ✅ **Armazenar os "blocos aprendidos"** da IA em uma estrutura como uma **árvore de conhecimento**, para que ela use o histórico de aprendizado como base para futuras decisões.

---

## 💬 Exemplo de Fluxo de Interação

```bash
Usuário: Ei, organize os arquivos.
IA: (Pensa...) → [Criar[Pasta "Documentos"]] + [Mover[*.txt → "Documentos"]]
IA: Organização concluída!
