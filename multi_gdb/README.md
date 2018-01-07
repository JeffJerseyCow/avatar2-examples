# Multi GDB Example

1. Create two similar machines &mdash; one to use as the instigator and one to use as the target. For example, provision two x86_64 virtual machines and ensure the architectures are the same. I use Kali 64 as my instigator and Ubuntu 64 as my target.
2. Install 'gdbserver' on both by running 'apt install gdbserver' or 'dnf install gdb-gdbserver'.
3. Prepare the example by running make and creating the 'gdb_example' executable.
4. Extract the .bss address and size using 'readelf -S ./gdb_example'
5. Locate a candidate break address using a disassembler. I chose to break on the instruction 'mov eax, dword [obj.val]' as this is the exact point where val is copied from the .bss in preparation for the call to printf.
6. Copy the 'gdb_example' binary to the instigator and the target. **It must be the same compiled binary!**
7. Run 'gdbserver --once 127.0.0.1:1234 ./gdb_example 22' on the instigator and 'gdbserver --once 127.0.0.1:1234 ./gdb_example 44' on the target. Note the different in command line argument.
8. Run the gdb_example.py script passing in the following arguments.
    * i_addr: IP address of the instigating GDB server e.g. IP address of my Kali machine
    * i_port: TCP port of the listening instigating GDB server
    * t_addr: IP address of the target GDB server e.g. IP address of my Ubuntu machine
    * t_port: TCP port of the listening target GDB server
    * bss_addr: Address of the gdb_example .bss section
    * bss_size: Size of the gdb_example .bss section
    * break_addr: Address to break on before transferring the .bss section

## Example
![Example Image](https://github.com/JeffJerseyCow/avatar2-examples/blob/master/multi_gdb/example.png)

**python3 ./gdb_example.py 127.0.0.1 1234 192.168.122.48 1234 -a 0x601034 -s 0xc -b 0x0040079a**
 
In the example you can see that the 'state' from the target machine (left) has been transferred to the instigator (right). 

If you would like an in depth explanation of the script and how it works then check out my blog write-up: http://jjc.re
