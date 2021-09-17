# LinuxEmbeddedSystem

## Книга
   Название: Встраиваемые системы на основе Linux  
   Автор: Крис Симмондс  
   HOST system: Debian 11 amd64  
   Оборудование: BeagleBone Black  
   Эмулятор: QEMU-system-arm  

## Характеристики BeagleBone Black rev C:
   Процессор: TI AM3358 1GHz ARM Cortex-A8 Sitara SoC;  
   ОЗУ: 512MB DDR3  
   Flash: eMMC 4GB  
   microSD, можно использовать как загрузочное устройство  
   mini-USB host-devhost  
   USB 2.0  
   Enthernet 10/100  
   HDMI для аудио и видео

## Дополнительные ресурсы
   Linux From Scratch: https://www.linuxfromscratch.org  
   Wiki Develop OS: https://wiki.osdev.org/Expanded_Main_Page  
   Linux Documentation: https://www.kernel.org/doc/html/latest/   
   Processor SDK Linux Software Developer’s Guide: http://software-dl.ti.com/processor-sdk-linux/esd/docs/latest/devices/AM335X/linux/index.html 
   This repo contains a Linux kernel that has been integrated with outstanding TI open source patches based on the open source Linux kernel found at kernel.org: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/  
   Tech doc MCPU: https://www.ti.com/product/AM3358#tech-docs

## NOTE
   The GCC compiler that is coming with AM335x PSDK Linux has the below flags: -march=armv7-a -marm -mfpu=neon -mtune=cortex-a8
   https://e2e.ti.com/support/processors-group/processors/f/processors-forum/754187/linux-am3358-exact-flags-for-gcc-compiler-to-specify-cpu-architecture-fpu
