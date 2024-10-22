
03. What is the difference between a Northbridge and a Southbridge chip? Why might I not find both on a modern motherboard?

04. What is dynamic RAM and how does it differ from static RAM? Which might my main RAM and my cache RAM be made of? Why will I not be able to see the cache RAM on my motherboard?

_____________________________________________________________________

## Computer Architecture 

North Bridge:
- Front-side Bus: Main Memory
- (Back-side Bus: Cache Mem. directly to the CPU)
- PCI-express Bus: Video Controller, Slots
- On the latest motherboards be integrated into the CPU.

South Bridge:
- PCI/ISA Bridge
- USB Port Interface
- Disk Controller
- Network Interface

## RAM 

RAM comes in three basic types:
* Static/SRAM (uses transistors, data remains as long as power applied, faster but costs more, consumes more power and so gets hot)
* Dynamic/DRAM (uses capacitors, needs to be refreshed, slower than static but cheaper and consumes less power so cooler to run)
* Cache. A specialist form of static RAM normally built into CPU as very fast access memory for immediate use by the processor.

We measure DRAM by its capacity, clock speed and bandwidth.
* Capacity: for example 1GByte
* Clock speed: for example DDR400 (Double Data Rate DRAM, 400 Mhz)
* Bandwidth (data moved per second): based on clock speed x bus width. For example DDR400 might also be called PC3200 (approx 3.2 Gbits/sec) or PC6400 (6.4 Gbits/sec, if dual channel).

