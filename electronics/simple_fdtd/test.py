import subprocess
import sys
proc = subprocess.Popen(['/home/arthurdent/Programs/ngspice-32/install/bin/ngspice', '--pipe'],
                         stdin=subprocess.PIPE, stdout=subprocess.PIPE,
                        stderr=subprocess.STDOUT)

#ngspice does have a C api that might be faster, but

# while True:
#     # proc.stdin.write(('.tc' + '\n').encode())
#     # proc.stdin.flush()
#     # proc_read = proc.stdout.readline()
#
#     if proc_read:
#         print(proc_read)
#         # sys.stdout.flush()

source_file = 'test/test_spice/spice.cir'

proc.stdin.write(('source ' + source_file + '\n').encode())
proc.stdin.flush()
sys.stdout.flush()
print(proc.stdout.readline())
print(proc.stdout.readline())
print(proc.stdout.readline())
# print(proc.stdout.readline())

# print(proc.stderr.readline())
print(proc.stdout.peek())
proc.stdin.write(('tran 1p 1p\n').encode())
print(proc.stdout.readline())
print(proc.stdout.readline())
# tran
# proc.communicate('mike'.encode())[0].rstrip()
