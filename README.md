# About
This dockerfile should allow you to create your own docker image for ETCMC node, and then use that to containers.
The follwing website was used as a reference for creating this file: 
[https://status.etcmc-monitor.org/blog/headless-debian](https://status.etcmc-monitor.org/blog/headless-debian)

# Instructions
1. Create a working directory and place the dockerfile there
2. Download ETCMC-Linux.zip file from [here](https://github.com/Nowalski/ETCMC_Software/releases/download/Setup%2FWindows/ETCMC_Linux.zip)
3. Open a command line in the working dirctory and use the following command to create an image:

`docker build -t etmc-app .`

4. Create a container instance like this:

`docker run -d -p 5000:5000 --name your-container-name etcmc-app`

# Things to know
* This is a rough first-draft.  If and when I refine this file and discover more I will revise these instructions.
* I only test on one container instance.  In theory you can run multiple containers, but you need to change the host port for each additional contianer.
* If you need to upgrade the app when there is an update, you will need to delete and rebuild the container, which means you will lose any data it has saved.  When I get around to it, I will add instrcutions on volume mapping to fix this problem.
