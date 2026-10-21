# 4-bit SystemVerilog ALU

Kombinasyonel ALU; toplama, çıkarma, AND, OR ve XOR işlemlerini yapar.

## İşlem kodları

| `op` | İşlem |
|---|---|
| `3'b000` | Toplama |
| `3'b001` | Çıkarma |
| `3'b010` | AND |
| `3'b011` | OR |
| `3'b100` | XOR |

`zero`, sonucun sıfır olduğunu belirtir. `carry`, toplama işlemindeki 4 bit dışına taşan biti verir. `borrow`, çıkarma işleminde `a < b` ise 1 olur.

## Dosyalar

- `alu4.sv`: ALU tasarımı
- `tb_alu4.sv`: İşlemleri ve bayrakları kontrol eden testbench

Icarus Verilog ile çalıştırma:

```sh
iverilog -g2012 -s tb_alu4 -o alu_sim alu4.sv tb_alu4.sv
vvp alu_sim
```
