# Get the root directory
$rootPath = "lib"

# Check if the root directory exists
if (Test-Path -Path $rootPath -PathType Container) {

    # Function to recursively display the folder structure
    function Show-FolderStructure {
        param (
            [string]$path,
            [string]$indent = ""
        )

        # Get the items in the current directory
        $items = Get-ChildItem -Path $path

        # Loop through each item
        foreach ($item in $items) {
            # Display the item name with indentation
            Write-Host "$indent$(if ($item.PSIsContainer) { "├── " } else { "    └── " })$($item.Name)"

            # If the item is a directory, recursively call the function
            if ($item.PSIsContainer) {
                if ($items[-1].Name -eq $item.Name) {
                    Show-FolderStructure -path $item.FullName -indent "$indent    "
                } else {
                    Show-FolderStructure -path $item.FullName -indent "$indent│   "
                }

            }
        }
    }

    # Display the root directory name
    Write-Host "$rootPath/"

    # Display the folder structure
    Show-FolderStructure -path $rootPath

} else {
    Write-Host "The directory '$rootPath' does not exist."
}