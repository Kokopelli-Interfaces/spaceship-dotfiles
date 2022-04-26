# This is a sample commands.py.  You can add your own commands here.
#
# Please refer to commands_full.py for all the default commands and a complete
# documentation.  Do NOT add them all here, or you may end up with defunct
# commands when upgrading ranger.

# A simple command for demonstration purposes follows.
# -----------------------------------------------------------------------------

from __future__ import (absolute_import, division, print_function)

# You can import any python module as needed.
import os
import os.path
import ranger.api
import ranger.core.fm
import ranger.ext.signals
from subprocess import Popen, PIPE, run

# You always need to import ranger.api.commands here to get the Command class:
from ranger.api.commands import Command
from subprocess import PIPE

class sk_cd(Command):
    def execute(self):
        command ="fd -L . --type d | cut -b3- | sk"
        if self.fm.settings['show_hidden']:
            command ="fd --hidden -L . --type d | cut -b3- | sk"

        sk = self.fm.execute_command(command, stdout=PIPE)
        stdout, stderr = sk.communicate()
        directory = stdout.decode('utf-8').rstrip('\n')
        self.fm.cd(directory)

# Now, simply bind this function to a key, by adding this to your ~/.config/ranger/rc.conf: map <C-f> sk_select
class sk_select(Command):
    """
    :sk_select

    Find a file using sk and fd.
    """
    def execute(self):
        import subprocess
        command ="fd -L -t f . | sed 1d | cut -b3- | sk"
        if self.fm.settings['show_hidden']:
            command ="fd -t f -L . --hidden | sed 1d | cut -b3- | sk"

        sk = self.fm.execute_command(command, stdout=subprocess.PIPE)
        stdout, stderr = sk.communicate()
        if sk.returncode == 0:
            sk_file = os.path.abspath(stdout.decode('utf-8').rstrip('\n'))
            if os.path.isdir(sk_file):
                self.fm.cd(sk_file)
            else:
                self.fm.select_file(sk_file)


# Now, simply bind this function to a key, by adding this to your ~/.config/ranger/rc.conf: map <C-g> sk_scan
class sk_scan(Command):
    """
    :sk_scan

    Find a file using sk and rg.
    """
    def execute(self):
        import subprocess
        command ="rg . | sk --delimiter=: --nth=2.."
        if self.fm.settings['show_hidden']:
            command ="rg . --hidden | sk --delimiter=: --nth=2.."

        sk = self.fm.execute_command(command, stdout=subprocess.PIPE)
        stdout, stderr = sk.communicate()
        if sk.returncode == 0:
            sk_file = os.path.abspath(stdout.decode('utf-8').rstrip('\n'))
            if os.path.isdir(sk_file):
                self.fm.cd(sk_file)
            else:
                self.fm.select_file(sk_file)
