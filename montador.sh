clear
echo "Iniciando o script..."

echo "Montando 'bootloader.bin' em binario/"
nasm -f bin bootloader.asm -o binario/bootloader.bin

echo "Montando 'kernel.bin' em binario/"
mv kernel.zig binario/
cd binario/
zig build-exe kernel.zig
mv kernel.zig ../
cd ..

echo "Criar a imagem de disco vazia (1.44 MB):"
dd if=/dev/zero of=imgOS.img bs=512 count=2880
mv imgOS.img imgOS/

dd if=binario/bootloader.bin of=imgOS/imgOS.img conv=notrunc
dd if=binario/kernel.o of=imgOS/imgOS.img bs=512 seek=1 conv=notrunc

echo "Script finalizado."