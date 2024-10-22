
05. How (using filters and crystals) does an LCD display generate an image? 
How would this process differ for a CRT screen? Why is a CRT screen dangerous?

06. My PC has a colour depth of 32 bits and a 16:9 screen. What does that mean?

_____________________________________________________________________


## Display Technology ==

* The hardware to drive the display is sometimes built into the motherboard (and normally lower spec) but more often supplied as a separate daughter board plugged into an AGP socket (parallel) or more recently a PCI-Express (PCI-e) port (serial).

* AGP and PCI-e cards are essentially a computer in their own right with a GPU, chipsets and RAM of their own so they can process data fast enough


## Bit depth (or colour depth)

* 24 bit; RGB; True Colour

Video card may offer 8 bits of color precision (256 output levels) per R/G/B color channel, for an overall 24-bit color space (or 32-bit space, with alpha transparency bits)

* 8 bit; 256 colour

there are 3 bits (8 possible levels) for each of the R and G components, and the two remaining bits in the byte pixel to the B component (four levels), enabling 256 (8 × 8 × 4) different colors.

* 16 bit; High Colour

High color supports 15/16-bit for three RGB colors. In 16-bit direct color, there can be 4 bits (16 possible levels) for each of the R, G, and B components, plus optionally 4 bits for alpha (transparency), enabling 4,096 (16 × 16 × 16) different colors with 16 levels of transparency.

## Image Characteristics 

Dot pitch
* Distance between phosphors of the same colour, typically .28mm 

Resolution
* 640x480; 800x600; 1024x768; 1280x1024; 1600x1200 or more
* Older systems 4:3 screen ratio but 16:9 widescreen increasingly common.

Why does AGP/PCI-e hardware need to be so powerful/fast?
* Well, a typical screen will display 50-70 frames per second
* Say we are using even a low resolution like 1024 x 768 if we use 32 bit colour depth:
* 1024 x 768 = 786432 pixels, each 4 bytes
= 3072 Kbytes x (for example) 50 frames = 150 MB/s
= we need to process 150 Mbytes of data per second

## LCD 

Cathode Ray Tube (CRT) 
* Old technology used in TV screens
* An electron beam is fired at a specially phosphor coated glass screen.
* Each pixel consists of three different colour dots (in colour displays) which glow briefly when excited by the appropriate beam (R, G or B).
* CRTs screens contain high voltage and are very dangerous, do not open!

Liquid Crystal Displays (LCD) 
* Modern technology used in current flatscreens 
* Use Thin Film Transistor (TFT) technology
* Cells made of crystals which rotate white light (from a backlight) through a polarising filter  to switch a pixel off or on behind an RGB grid to make colours like CRT.

- Light from the backlight passes through the 1st polarising filter which aligns it in one direction only.
* This light cannot get through the 2nd polarising filter as it is aligned at an angle to the first.
* However the liquid crystals when energised rotate the light by the same amount as the two filters are offset letting it pass the 2nd filter.
* The colour gel contains the RGB “dots” which colour the pixels.

