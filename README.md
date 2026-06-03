# 🚀 Gato-Project : The Learning Journey

Repositori ini adalah catatan perjalanan dan *growth progress* saya dalam eksplorasi *low-level systems programming*, arsitektur x86, dan *operating system development*. Tujuan utamanya adalah mencatat transisi pemahaman saya -dari interaksi dengan *hardware* di level paling dasar, -hingga jika memungkinkan membangun kernel sederhana dan/atau dilanjutkan ke userspace.
Kode-kode yang saya tampilkan nantinya bukanlah kode level produksi (apalagi kode yang sempurna), namun merupakan kode-kode yang mengakomodasi saya untuk mengeksplore programming dalam tiap level komputer, sehingga sangat dimungkinkan akan banyak kekurangan (kritik dan masukan sangat diharapkan).

## 📈 Progress Log

Bagian ini akan terus di-*update* seiring berjalannya waktu untuk mencatat update dan perkembangan baru.

### Phase 1: Booting Up (Current Focus)
- [ ] **Multiboot Bootloader:** Implementasi *bootloader* custom di Legacy BIOS.

## 🛠️ Tech Stack & Environment

Pendekatan *development* di repo ini mengutamakan kontrol sedekat mungkin pada *hardware* dan *setup environment* yang minimalis (dalam batas tertentu):

* **Languages:** x86 Assembly, C
* **Assembler & Toolchain:** NASM, LLVM/Clang
* **Environment:** Native Windows 
* **Editor:** Lite XL
* **Build Tool:** GNU Make For Windows
* **Emulator (For Testing):** Qemu

## 📂 Repository Structure

*(Struktur folder ini akan mulai terisi saat source code di-upload)*

```text
├── bootloader/     # Source code untuk multiboot bootloader
├── build/          # Build scripts (termasuk Makefiles)
