# Multi GDB Example

1. Create two similar machines to use as instigator and target. For example, build two x86_64 virtual machines to ensure the architecture is the same. I use Kali 64 as my instigator and Ubuntu 64 as my target.
2. Install 'gdbserver' on both by running 'apt install gdbserver' or 'dnf install gdb-gdbserver'.
3. Prepare the example by running make and creating the 'gdb_example' executable.
4. Extract the .bss address and size using 'readelf -S ./gdb_example'
5. Locate a candidate break address using a disassembler. I chose to break on the instruction 'mov eax, dword [obj.val]' as this is the exact point where val is copied from the .bss in preparation for the call to printf.

If you would like an in depth explanation of the script and how it works then check out my blog write-up [link test itself]: http://jjc.re