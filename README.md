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

Update:
When you start up using the option command to select the OS drive, you'll be presented a 5 second countdown where you can turn on/plug in your egpu before it proceeds.
If it's already on, you'll see your device...possibly not existing.  If there's any issues, it will revert to bootx64_original.efi and you'll have a mix driver set which causes some odd issues.

I'm using an external display and if you do the same, you could just disconnect the display from a direct connection to the apple device...this will elimiate the need for this loader.
```

This is built via mac.  Windows should work but using cmd or powershell instead.  This requires docker to be installed and running
1) Download the files and expand to a folder
2) CD to the folder in terminal in MacOS
## Build via docker (output file will be located in the same folder)
```bash
docker build --no-cache -t apple_set_os_loader .
docker run --rm -it -v "$(pwd):/build" apple_set_os_loader
rm -f bootx64.efi bootx64.so
docker run --rm -it -v "$(pwd):/build" -w /build apple_set_os_loader make -B V=1
```
