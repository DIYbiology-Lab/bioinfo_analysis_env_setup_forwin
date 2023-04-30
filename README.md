This is a PowerShell script for setting up a bioinformatics analysis environment on a Windows PC.
The script first installs Ubuntu 22.04 LTS on WSL2 and then installs Docker CLI inside it.
In then builds a local server containers by mapping specific, explicit ports based on the following container images.
  1. Galaxy server  
  2. RStudio server  
With the local host connection to this containers in a web browser such as Google Chrome, any analysis can be performed using the GUI on the web browser.