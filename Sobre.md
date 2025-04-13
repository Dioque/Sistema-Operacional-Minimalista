# 🧠 IA - SOS

Este projeto é a junção de duas ideias principais:

1. Um **Sistema Operacional Simples (SOS)**, desenvolvido do zero em **Rust** (com partes críticas em **Assembly**).
2. Uma **Inteligência Artificial** que vive dentro do SOS, aprende a interagir com o sistema, e evolui com base nas suas próprias experiências, sem ser programada diretamente.

---

## 💻 Sobre o SOS

O SOS é um sistema operacional minimalista construído do zero, com os seguintes objetivos:

- Escrito em **Rust**, com partes em **Assembly** (interrupções, bootloader, manipulação de hardware).
- Rodando sem dependência de sistemas externos, com foco em controle total do ambiente.
- Tudo é construído do zero: drivers, protocolos, sistema de arquivos, gerenciamento de memória, etc.

---

## 🧠 Sobre a IA dentro do SOS

A IA será uma entidade que **vive exclusivamente dentro do SOS**. Ela não conhece nada sobre o mundo externo e aprende com base no ambiente que o sistema oferece. Ela não tem interface visual — só existe na lógica e no sistema de arquivos do SOS.

### Características:

- A IA não começa sabendo nada.
- Ela só interage com o usuário e com o sistema operacional.
- Aprende comandos como "criar arquivo", "apagar pasta", "mover arquivo", etc.
- Tudo é aprendido por **interação**, sem código prévio ensinando as ações.

---

## 🧱 Linguagem de Blocos (tipo Lego)

A IA usará uma linguagem modular, como se fossem **peças de Lego**, onde cada "bloco" representa uma ação. Ela aprende a combinar blocos para atingir objetivos e, com o tempo, consegue realizar tarefas complexas.

### Exemplos de blocos:

- `Criar[Pasta, nome="Projetos"]`
- `Se[Condição] → Faça[Algo]`
- `Ao_Ouvir["feliz aniversário"] → Enviar[Mensagem]`
- `Juntar[Texto, Variável]`
- `Mover[Arquivo, destino="Pasta"]`
- `Repetir[5] → Criar[Bloco]`

A IA irá testar combinações desses blocos, observar o resultado e aprender com a experiência — recompensas (ações que funcionam) e punições (ações que falham).

---

## 🎓 Aprendizado com Recompensas

A IA aprenderá com tentativa e erro:

1. Tenta uma combinação de blocos.
2. Se a ação for bem-sucedida (ex: uma pasta é criada), isso é interpretado como **recompensa**.
3. Se a ação falha (ex: erro de permissão, comando inválido), isso é interpretado como **falha**.
4. A IA **refina o comportamento** com base no que funcionou.

Com o tempo, ela aprende a:

- Atender comandos do usuário: "Organize os arquivos."
- Fazer associações: entender que "organizar" pode envolver criar pastas e mover arquivos.
- Realizar ações complexas de forma autônoma.

---

## 💡 Exemplos de Aplicações Futuras

- **Organização automática**:
  - `Analisar[Arquivos] → Criar[Pasta por Tipo] → Mover[Arquivo]`

- **Mensagem personalizada**:
  - `Detectar[Aniversário] → Gerar[Mensagem] → Enviar[Para: Pessoa]`

- **Criação de estruturas**:
  - `Criar[Muro] + Empilhar[Bloco] + Repetir[10x]` → "Castelo"

---

## 🔧 Ferramentas e Implementação

- ✅ Criar um **interpretador simples em Rust** para transformar os blocos em ações reais.
- ✅ Definir uma **gramática da linguagem de blocos**, com regras de combinação e hierarquia.
- ✅ Armazenar os "blocos aprendidos" da IA em uma **árvore de conhecimento** que vai crescendo com o tempo.
- ✅ Criar um sistema de recompensas e consequências dentro do SOS.
- ✅ Manter toda a IA e a linguagem dentro do SOS (sem ambientes externos).

---

## 💬 Exemplo de Fluxo de Interação

```bash
Usuário: Ei, organize os arquivos.
IA: (Pensa...) → [Criar[Pasta "Documentos"]] + [Mover[*.txt → "Documentos"]]
IA: Organização concluída!
