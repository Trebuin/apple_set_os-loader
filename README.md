# apple_set_os loader
Tiny EFI program for unlocking the Intel IGD on the MacBook for Linux and Windows.
This loader will load bootx64_original.efi once apple_set_os is loaded and fix the issue which apple_set_os cannot be loaded sometimes.

Based on 0xbb's apple_set_os.efi
https://github.com/0xbb/apple_set_os.efi


## Usage
```
1. Set Security Boot to "No Security"

2. Mount EFI partition

3. Rename /EFI/Boot/bootx64.efi to /EFI/Boot/bootx64_original.efi

4. Copy bootx64.efi from this repository to /EFI/Boot

5. If you dont have Windows installed, you need to bless the efi so the efi will run at startup.
```

This is built via mac.  Windows should work but using cmd or powershell instead.  This requires docker to be installed and running
1) Download the files and expand to a folder
2) CD to the folder in terminal in MacOS
## Build via docker (output file will be located in the same folder)
```bash
docker build --no-cache -t apple_set_os_loader .
docker run --rm -it -v "$(pwd):/build" apple_set_os_loader
```
