/*
 * This macro processes image files in a selected input directory.
 * It performs channel splitting, color assignment, and Z projection,
 * saving the results in a matching output directory structure.
 *
 * Do not use the built-in "Run" button in the Plugins menu,
 * instead, run this script from the Macro Editor directly.
 */

// Input directory containing the image files
#@ File (label = "Input directory", style = "directory") input

// Output directory where processed results will be saved
#@ File (label = "Output directory", style = "directory") output 

// File extension to look for
#@ String (label = "File suffix", value = ".czi") suffix 

// Channel color assignments via dropdown menus
#@ String (label = "Color of Channel 0", choices={"Cyan", "Green", "Red", "Blue", "Yellow", "Magenta", "Red/Green", "Spectrum", "Ice", "Fire", "Grays" }, style="listBox") channel_0 
#@ String (label = "Color of Channel 1", choices={"Cyan", "Green", "Red", "Blue", "Yellow", "Magenta", "Red/Green", "Spectrum", "Ice", "Fire", "Grays" }, style="listBox") channel_1
#@ String (label = "Color of Channel 2", choices={"Cyan", "Green", "Red", "Blue", "Yellow", "Magenta", "Red/Green", "Spectrum", "Ice", "Fire", "Grays" }, style="listBox") channel_2
#@ String (label = "Color of Channel 3", choices={"Cyan", "Green", "Red", "Blue", "Yellow", "Magenta", "Red/Green", "Spectrum", "Ice", "Fire", "Grays" }, style="listBox") channel_3

// Prevent images from appearing during processing
setBatchMode(true); 

// Begin processing from the root input directory
processDirectory(input, input); 


function processDirectory(input, inputRoot) 
{
	list = getFileList(input); 
	list = Array.sort(list);
	
	// Recursively process subfolders and valid image files
	for (i = 0; i < list.length; i++) 
	{ 
		if(File.isDirectory(input + File.separator + list[i]))
			processFolder(input + File.separator + list[i], inputRoot);
		if(endsWith(list[i], suffix))
			processFile(input, output, list[i], inputRoot);
	}
}

function processFile(input, output, file, inputRoot) 
{
	filePath = input + File.separator + file;
	
	// Import image with Bio-Formats and split channels
	run("Bio-Formats Importer", "open=[" + filePath + "] autoscale color_mode=Default rois_import=[ROI manager] split_channels view=Hyperstack stack_order=XYCZT");
	
	generatedImg = getList("image.titles"); 
	print("Processing: " + file);
	
	// Trim root path to get relative subdirectory
	inputRootTrim = replace(inputRoot, "\\", "\\\\"); 
	child = replace(input, inputRootTrim, "");
	if (child.startsWith(File.separator)) 
	{
    	child = child.substring(1);
	}
	
	newDirectory = output + File.separator + child;
	File.makeDirectory(newDirectory); 
	
	 // Assign colors and process each generated channel image
	for (i = 0; i < generatedImg.length; i++) 
	{
		title = generatedImg[i];
		if (startsWith(title, replace(file, ".czi", ""))) 
		{
			selectImage(title);
			
			if (endsWith(title, "C=0")) run(channel_0);
			if (endsWith(title, "C=1")) run(channel_1);
			if (endsWith(title, "C=2")) run(channel_2);
			if (endsWith(title, "C=3")) run(channel_3);
			
			// Run the max intensity feature of the Z Project Plugin
			run("Z Project...", "projection=[Max Intensity]"); 
			
			// This will Save the file in the new directory
			saveAs("Tiff", newDirectory + File.separator + replace(title, ".czi", ""));  
			close();
		}
	}
	print("Finished: " + file);
	print("Saving to: " + newDirectory);
}
