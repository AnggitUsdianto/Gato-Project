# Gato-Project : The Bare Metal Journey

Repositori ini adalah catatan perjalanan dan *growth progress* gw dalam mengeksplorasi *low-level systems programming*, arsitektur x86, dan *operating system development*. Tujuan utama repo ini adalah mencatat transisi pemahaman gw-dari berinteraksi dengan *hardware* di level paling dasar, hingga membangun arsitektur sistem dari nol.

## Progress Log

Bagian ini akan terus di-*update* seiring berjalannya waktu untuk mencatat pencapaian, hasil *debugging*, dan *milestone* baru.

### Phase 1: Booting Up (Current Focus)
- [ ] **Multiboot Bootloader:** Implementasi *bootloader* kustom di Legacy BIOS.

## 🛠️ Tech Stack & Environment

Pendekatan *development* di repo ini mengutamakan kontrol sedekat mungkin pada *hardware* dan *setup environment* yang efisien, cepat, dan *native*:

* **Languages:** x86 Assembly, C
* **Assembler & Toolchain:** NASM, LLVM/Clang
* **Environment:** Native Windows 
* **Development Tools:** Lite XL

## 📂 Repository Structure

*(Struktur folder ini akan mulai terisi saat source code di-upload)*

```text
├── bootloader/     # Source code untuk multiboot bootloader (Coming soon!)
├── kernel/         # Core kernel files, memory management, dan 32-bit entry points
├── build/          # Build scripts (termasuk Makefiles) dan compiled binaries
└── docs/           # Catatan pribadi, referensi spesifikasi UEFI/x86, dan arsitektur
