The River-Herring_2023 folder contains the data, code, documents, outputs, and presentations associated 
with Meghan Slocombe's honors thesis. The thesis was completed May 2020.

This research is focused on juvenile river herring diets within freshwater coves. The data includes fish gut
dissection, environmental, and water column zooplankton data.

The following folders contain:
	Code: R code used to run analyses and create graphs. All of this code is in the River-Herring_2023.proj 
		project
	DataClean: Tidy data used in R analyses
	DataRaw: Data initially entered into spreadsheets. See metadata files for more data details
	Documents: Writing documents including drafted portions of the manuscript
	Outputs: Images, graphs, tables that are outputs of code or image files
	Presentations: Previous presentations on the data

.gitignore is directiing git to ignore the following files:
	DataClean/ ~ignoring data to limit the file size that I upload to git
	DataRaw/ ~ignoring data to limit the file size that I upload to git
	Documents/ ~ignoring documents because they are not compatible with git
	Outputs/ ~ignoring images and outputs because they can be regenerated with code
	Presentations/ ~ignoring presentations because they are not compatible with git
	*.Rhistory ~ignoring because desired commands will be saved in the code
	*Rproj.user ~ignoring because desired commands and outputs will be saved/reproducible via code
