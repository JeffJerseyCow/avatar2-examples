import sys
import argparse

from avatar2.avatar2 import Avatar
from avatar2.archs.x86 import X86_64
from avatar2.avatar2 import TargetStates
from avatar2.targets.gdb_target import GDBTarget


def main():
    """
    Main entry point.
    """

    # Set parser
    parser = argparse.ArgumentParser(description='Multi GDB avatar2 example')
    parser.add_argument('i_addr', help='ip address of initiating GDB server')
    parser.add_argument('i_port', type=int, help='tcp port of initiating GDB server')
    parser.add_argument('t_addr', help='ip address of target GDB server')
    parser.add_argument('t_port', type=int, help='tcp port of target GDB server')
    parser.add_argument('--bss-addr', '-a', default='0x601034', help='address of .bss section')
    parser.add_argument('--bss-size', '-s', default='0xc', help='size of .bss section')
    parser.add_argument('--break-addr', '-b', default='0x0040079a', help='break point when val is'
                                                                         'copied from the .bss')
    args = parser.parse_args()

    # Parse arguments
    i_addr = args.i_addr
    i_port = args.i_port
    t_addr = args.t_addr
    t_port = args.t_port

    # Parse .bss address
    try:
        bss_addr = int(args.bss_addr, 16)
    except ValueError:
        print('[-] Invalid bss address "{}"'.format(args.bss_addr))
        return False

    # Parse .bss size
    try:
        bss_size = int(args.bss_size, 16)
    except ValueError:
        print('[-] Invalid bss size "{}"'.format(args.bss_size))
        return False

    # Parse break point address
    try:
        break_addr = int(args.break_addr, 16)
    except ValueError:
        print('[-] Invalid break address "{}"'.format(args.break_addr))
        return False

    # Avatar context
    avatar = Avatar(X86_64)

    # Add targets
    instigator = avatar.add_target(GDBTarget,
                                   gdb_ip=i_addr,
                                   gdb_port=i_port)
    target = avatar.add_target(GDBTarget,
                               gdb_ip=t_addr,
                               gdb_port=t_port)

    # Initialise targets
    avatar.init_targets()

    # Create memory maps
    bss = avatar.add_memory_range(bss_addr, # .bss virtual address
                                  bss_size, # .bss size
                                  permissions='rw-',
                                  forwarded=True,
                                  forwarded_to=instigator)

    # Add on .bss read
    target.set_breakpoint(break_addr)
    target.cont()
    target.wait(TargetStates.STOPPED)

    # Synchronise instigator
    instigator.set_breakpoint(break_addr)
    instigator.cont()
    instigator.wait(TargetStates.STOPPED)

    # Transfer
    avatar.transfer_state(target, instigator, sync_regs=False, synced_ranges=[bss])

    # Wait for clean exit
    target.cont()
    target.wait(TargetStates.EXITED)

    instigator.cont()
    instigator.wait(TargetStates.EXITED)

    # Clean up
    avatar.shutdown()
    return True


if __name__ == '__main__':
    """
    Exit on main return code.
    """

    sys.exit(main())