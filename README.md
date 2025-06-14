# ColorSplit
A batch-processing ImageJ macro that processes .czi image files, splits it into four separate channels, assigns user-defined color maps, performs a Z-stack projection (Max Intensity), and saves the result as TIFF files in a mirrored output directory structure.

## Features

- Scans Directories for `.czi` files
- Splits image channels and lets you assign a color to each (C0–C3)
- Applies **Z Project: Max Intensity**
- Exports results as `.tif` files
- Recreates original directory structure in the output folder

---

## Requirements

- **Fiji (ImageJ distribution)** 
  Download from [https://fiji.sc/](https://fiji.sc/)

- Works on:
  - Windows
---

## Installation

### 1. Download and Install Fiji

If not already installed:  
[Download Fiji here](https://fiji.sc/)

### 2. Download the Macro

1. Download the [ColorSplit macro right here!](https://github.com/CaleAWineinger/ColorSplit/releases/download/v1.0.0/Color_Split.ijm)
2. Open your File Explorer and go to `fiji-latest-win64-jdk > Fiji > scripts`
3. Move the downloaded ColorSplit file into the scripts folder.
4. Make sure to restart Fiji if it is currently open.
---

## How to Run

**Important:**  
Do **not** run using `Plugins > Macros > Run...` — it will not work correctly.  
You must **Use the Script feature** and run it from there.

### Steps:

1. Go to `Plugins > Scripts > Color Split`

The Scripts tab is at the bottom under plugins it may require some scrolling to get to.
   
2. You’ll be prompted to:

- Select an **Input directory** (containing `.czi` files)
- Select an **Output directory**
- Confirm the **file suffix** (usually `.czi`)
- Choose colors for **Channel 0–3**

The log will show you which files and directories have been processed and where they have been saved to.

---
