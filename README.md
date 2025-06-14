# ColorSplit
A batch-processing ImageJ macro that recursively processes .czi image files, splits their channels, assigns user-defined color maps, performs Z-stack projection (Max Intensity), and saves the result as TIFF files in a mirrored output directory structure.

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

1. Download the [ColorSplit macro right here!](./ColorSplit.ijm)
2. Make sure you move it to a directory you have easy access to
---

## How to Run

**Important:**  
Do **not** run using `Plugins > Macros > Run...` — it will not work correctly.  
You must **open it in the Macro Editor** and run it from there.

### Steps:

1. Go to `Plugins > Macros > Edit...`
2. Open your macro file
3. Click `Run`

You’ll be prompted to:

- Select an **Input directory** (containing `.czi` files)
- Select an **Output directory**
- Confirm the **file suffix** (usually `.czi`)
- Choose colors for **Channel 0–3**

The log will show you which files and directories have been processed and where they have been saved to.

---
