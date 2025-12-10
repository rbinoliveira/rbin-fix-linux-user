# 🛠️ Linux User Fix Tool

<div align="center">

![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)
![Bash](https://img.shields.io/badge/Bash-4EAA25?style=for-the-badge&logo=gnu-bash&logoColor=white)
![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)

**Diagnose and fix user login issues on Linux systems**

[🇺🇸](#-english) • [🇧🇷](#-português)

</div>

---

## 🇺🇸 English

> Tool to diagnose and fix user login problems on Linux systems

This repository contains a simple, focused utility for fixing common Linux user login issues. The script helps diagnose and automatically fix problems like:

- User cannot log in (wrong shell, missing home directory, etc.)
- Permission problems with user directories
- Corrupted user configuration
- Account lock status
- Password expiry issues
- Shell configuration problems

### 🚀 Quick Start

#### 1. Clone the repository

```bash
git clone https://github.com/devrubinho/rubinho-fix-linux-user.git
cd rubinho-fix-linux-user
```

#### 2. Run the script

**Using the main entry point (recommended):**

```bash
sudo bash run.sh
```

**Or run the script directly:**

```bash
sudo bash scripts/fix_user.sh
```

**With a user number (non-interactive):**

```bash
sudo bash scripts/fix_user.sh 1
```

### 📋 Requirements

- **Linux** system (any recent distribution)
- **Bash** (pre-installed on Linux)
- **sudo/root access** (required for system modifications)

### ⚠️ Platform Check

This script is **Linux-only**. If you try to run it on macOS, it will detect the platform and exit with a clear error message:

```
⚠️  PLATFORM ERROR

❌ This script is designed for Linux systems only.
   Detected platform: macOS
```

### 🎯 Features

The script performs comprehensive diagnostics and fixes:

1. **User Existence Check** - Verifies user exists, can create if needed
2. **Account Lock Status** - Checks and unlocks locked accounts
3. **Shell Validation** - Verifies shell exists and is in `/etc/shells`
4. **Home Directory** - Checks existence, ownership, and permissions
5. **Password Status** - Checks if password is set and expiry status
6. **Shell Configuration** - Creates missing `.bashrc`, `.profile`, etc.
7. **Sudo Access** - Checks and can add user to sudo/wheel group
8. **Login Test** - Tests if user can successfully log in

### 📖 Usage

#### Interactive Mode

```bash
sudo bash run.sh
```

The script will:
1. List all system users
2. Ask you to select a user (by number)
3. Run diagnostics
4. Prompt for fixes as issues are found

#### Non-Interactive Mode

```bash
sudo bash scripts/fix_user.sh 2
```

This will automatically select user #2 from the list and run diagnostics.

### 🛡️ Safety Features

- ✅ Requires explicit confirmation before making changes
- ✅ Shows exactly what will be fixed before proceeding
- ✅ Validates all inputs
- ✅ Only modifies what you approve
- ✅ Platform detection prevents accidental execution on macOS

### 📁 Repository Structure

```
rubinho-fix-linux-user/
├── LICENSE                  # MIT License
├── readme.md                # This file
├── run.sh                   # Main entry point (with platform check)
├── scripts/
│   └── fix_user.sh          # Core fix user script
└── lib/
    └── platform.sh          # Platform detection module
```

### 🐛 Troubleshooting

#### Script won't run

**Problem:** `Permission denied` when running scripts

**Solution:**
```bash
chmod +x run.sh
chmod +x scripts/fix_user.sh
```

#### Need root privileges

**Problem:** Script requires sudo but you forgot

**Solution:**
```bash
sudo bash run.sh
```

#### User still can't log in after fix

**Check:**
1. PAM configuration in `/etc/pam.d/`
2. SSH configuration if logging in remotely
3. System logs: `journalctl -u sshd` or `/var/log/auth.log`
4. SELinux/AppArmor restrictions

### 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 🇧🇷 Português

> Ferramenta para diagnosticar e corrigir problemas de login de usuários em sistemas Linux

Este repositório contém uma utilidade simples e focada para corrigir problemas comuns de login de usuários no Linux. O script ajuda a diagnosticar e corrigir automaticamente problemas como:

- Usuário não consegue fazer login (shell errado, diretório home ausente, etc.)
- Problemas de permissão com diretórios de usuário
- Configuração de usuário corrompida
- Status de bloqueio de conta
- Problemas de expiração de senha
- Problemas de configuração do shell

### 🚀 Início Rápido

#### 1. Clonar o repositório

```bash
git clone https://github.com/devrubinho/rubinho-fix-linux-user.git
cd rubinho-fix-linux-user
```

#### 2. Executar o script

**Usando o ponto de entrada principal (recomendado):**

```bash
sudo bash run.sh
```

**Ou executar o script diretamente:**

```bash
sudo bash scripts/fix_user.sh
```

**Com um número de usuário (não interativo):**

```bash
sudo bash scripts/fix_user.sh 1
```

### 📋 Requisitos

- Sistema **Linux** (qualquer distribuição recente)
- **Bash** (pré-instalado no Linux)
- **Acesso sudo/root** (necessário para modificações no sistema)

### ⚠️ Verificação de Plataforma

Este script é **apenas para Linux**. Se você tentar executá-lo no macOS, ele detectará a plataforma e sairá com uma mensagem de erro clara:

```
⚠️  PLATFORM ERROR

❌ Este script é projetado apenas para sistemas Linux.
   Plataforma detectada: macOS
```

### 🎯 Funcionalidades

O script realiza diagnósticos e correções abrangentes:

1. **Verificação de Existência do Usuário** - Verifica se o usuário existe, pode criar se necessário
2. **Status de Bloqueio da Conta** - Verifica e desbloqueia contas bloqueadas
3. **Validação do Shell** - Verifica se o shell existe e está em `/etc/shells`
4. **Diretório Home** - Verifica existência, propriedade e permissões
5. **Status da Senha** - Verifica se a senha está definida e status de expiração
6. **Configuração do Shell** - Cria `.bashrc`, `.profile`, etc. ausentes
7. **Acesso Sudo** - Verifica e pode adicionar usuário ao grupo sudo/wheel
8. **Teste de Login** - Testa se o usuário pode fazer login com sucesso

### 📖 Uso

#### Modo Interativo

```bash
sudo bash run.sh
```

O script irá:
1. Listar todos os usuários do sistema
2. Pedir para você selecionar um usuário (por número)
3. Executar diagnósticos
4. Solicitar correções conforme os problemas são encontrados

#### Modo Não Interativo

```bash
sudo bash scripts/fix_user.sh 2
```

Isso selecionará automaticamente o usuário #2 da lista e executará os diagnósticos.

### 🛡️ Recursos de Segurança

- ✅ Requer confirmação explícita antes de fazer alterações
- ✅ Mostra exatamente o que será corrigido antes de prosseguir
- ✅ Valida todas as entradas
- ✅ Modifica apenas o que você aprovar
- ✅ Detecção de plataforma impede execução acidental no macOS

### 📁 Estrutura do Repositório

```
rubinho-fix-linux-user/
├── LICENSE                  # Licença MIT
├── readme.md                # Este arquivo
├── run.sh                   # Ponto de entrada principal (com verificação de plataforma)
├── scripts/
│   └── fix_user.sh          # Script principal de correção de usuário
└── lib/
    └── platform.sh          # Módulo de detecção de plataforma
```

### 🐛 Solução de Problemas

#### Script não executa

**Problema:** `Permission denied` ao executar scripts

**Solução:**
```bash
chmod +x run.sh
chmod +x scripts/fix_user.sh
```

#### Precisa de privilégios root

**Problema:** Script requer sudo mas você esqueceu

**Solução:**
   ```bash
sudo bash run.sh
```

#### Usuário ainda não consegue fazer login após correção

**Verifique:**
1. Configuração PAM em `/etc/pam.d/`
2. Configuração SSH se estiver fazendo login remotamente
3. Logs do sistema: `journalctl -u sshd` ou `/var/log/auth.log`
4. Restrições SELinux/AppArmor

### 📝 Licença

Este projeto está licenciado sob a Licença MIT - veja o arquivo [LICENSE](LICENSE) para detalhes.
