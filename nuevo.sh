sudo apt update  #Updates the package list from repositories (refreshes available software info).
sudo apt upgrade    #Upgrades all installed packages to their latest versions.
sudo apt install parted #Installs the **:contentReference[oaicite:0]{index=0}** tool for managing disk partitions.
sudo parted -l && echo -e "\n---\n" && lsblk -f && echo -e "\n---\n"
#Upgrades all installed packages to their latest versions.
#parted -l  Lists all disks and partition tables.  
#&& Executes the next command only if the previous one succeeds.
#echo -e "\n---\n"  Prints a separator (blank line + --- + blank line).
#lsblk -f  Shows block devices with filesystem info (UUID, type, mount point).
[ -d /sys/firmware/efi ] && echo "UEFI" || echo "BIOS"
#This command checks whether the system is booted in **UEFI or BIOS mode**.
#-d  Tests if the directory `/sys/firmware/efi` exists  
#&&   Runs the next command **only if the condition is true**
#echo "UEFI"  Prints **UEFI** if the directory exists
# ||   Runs the next command **if the previous one fails**
echo "esto es un archivo" > archivo.txt #Creates a file called `archivo.txt` and writes the textb "esto es un archivo"
stat archivo.txt #Displays detailed information about the file.