# Win-Tweaks

Pacote de otimizações para Windows focado em extrair o máximo do hardware, reduzir a latência (input lag) e aumentar os FPS em jogos. Inclui scripts em lote, edições no registro e utilitários portáteis que limpam e aceleram o sistema operacional.

⚠️ **AVISO IMPORTANTE:** Modificações no sistema e no registro podem ser irreversíveis se feitas incorretamente. **Sempre crie um Ponto de Restauração** antes de executar os scripts ou programas deste repositório.

---

## 📁 Estrutura do Repositório

O repositório está dividido em 5 etapas principais para facilitar o processo de otimização:

### 1. Debloat
Focado em limpar o lixo que vem pré-instalado no sistema.
* **Criar Ponto de Restauração:** Um atalho essencial para proteger seu sistema antes de iniciar as otimizações.
* **Scripts de Debloat:** Removem bloatwares, aplicativos inúteis do Windows e limpam chaves de registro associadas a eles, liberando memória e processamento.

### 2. Windows
Ajustes fundamentais no comportamento do sistema operacional.
* Desativação de recursos incômodos como UAC (Controle de Conta de Usuário) e atualizações automáticas.
* **BCD Tweaks:** Otimizações no setor de inicialização do Windows.
* Forçar o uso correto da GPU para garantir que os aplicativos usem o hardware dedicado, além de atalhos práticos como desfragmentação e acesso ao `gpedit`.

### 3. Serviços
Desativação de processos em segundo plano e ajustes finos de hardware.
* **Serviços e Telemetria:** Scripts para parar e desativar serviços de diagnóstico do Windows, rastreamento e indexação pesada.
* **Latência e Desempenho:** Ativação do plano de Máximo Desempenho, ajuste de Timer Resolution e redução geral do input lag.
* **Limpeza:** Automação para esvaziar cache do Windows Update e arquivos temporários.
* **GPU & CPU:** Subpastas contendo scripts com otimizações exclusivas focadas na arquitetura específica do seu hardware (AMD, Intel ou NVIDIA), separados para Desktops e Notebooks.

### 4. Regedits
Modificações profundas via Registro do Windows (`.reg`).
* **Prioridade de Hardware:** Ajustes que forçam o sistema a dar prioridade máxima de CPU e RAM para jogos.
* **Desativação de Recursos Gamer Inúteis:** Remoção do GameDVR e Xbox Game Bar, que costumam causar travamentos.
* **Resposta de Periféricos:** Otimização agressiva no tempo de resposta do mouse e teclado, removendo atrasos e filtros do Windows.
* Otimizações gerais de rede e desligamento mais rápido de aplicativos.

### 5. Programas
Ferramentas de terceiros essenciais para um ajuste avançado e granular do sistema. 

* **Dism++:** Uma interface gráfica poderosa que facilita a limpeza profunda do disco, o gerenciamento de backups e a configuração de recursos ocultos do Windows sem precisar usar linhas de comando.
* **AutoRuns:** Ferramenta oficial da Microsoft (Sysinternals) que mostra de forma detalhada absolutamente tudo o que inicia junto com o seu sistema. Permite desativar processos, serviços e drivers ocultos que atrasam o boot.
* **UnparkCpu:** Utilitário crucial para evitar o "Core Parking". Ele impede que o Windows coloque os núcleos do seu processador para "dormir" para economizar energia, garantindo que 100% do seu processador esteja disponível o tempo todo para jogos.
* 🛑 **Aviso sobre os outros programas:** Esta pasta contém outras ferramentas mais complexas (como manipuladores de MSI/IRQ, exploradores de energia e limpadores de dispositivos). **É obrigatório pesquisar extensamente sobre o uso de cada uma delas antes de executá-las.** O uso incorreto dessas ferramentas adicionais pode causar telas azuis (BSOD), corromper drivers e inutilizar portas USB ou placas de vídeo. Use por sua conta e risco.

---

## 🛠️ Como usar

1. Comece **opcionalmente** pela pasta `1. Debloat` executando o arquivo para criar um Ponto de Restauração.
2. Ao executar os arquivos `.bat` ou `.cmd`, clique sempre com o botão direito e selecione **"Executar como administrador"**.
3. Para os arquivos `.reg`, dê um duplo clique, clique em "Sim" para confirmar a adição das informações ao registro e dê "OK".
4. Após aplicar as otimizações e scripts desejados, **reinicie o computador** para que todas as alterações entrem em vigor adequadamente.
