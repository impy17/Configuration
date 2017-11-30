#!/usr/bin/python2

## REFERENCE
## http://candidtim.github.io/appindicator/2014/09/13/ubuntu-appindicator-step-by-step.html

## Add option to change to fan or something
## Get on startup

import gi
#gi.require_version('Gtk', '3.0')
#gi.require_version('AppIndicator3', '0.1')

from gi.repository import Gtk as gtk
from gi.repository import AppIndicator3 as appindicator
from gi.repository import GLib
import signal
import os
from subprocess import check_output

APPINDICATOR_ID = 'Status'

def main():
    signal.signal(signal.SIGINT, signal.SIG_DFL) # allows use of CTRL-C to exit
    icon_image = "/usr/share/unity/icons/temp.png" # icon image

    indicator = appindicator.Indicator.new(APPINDICATOR_ID,
            os.path.abspath(icon_image),
            appindicator.IndicatorCategory.SYSTEM_SERVICES)
    indicator.set_status(appindicator.IndicatorStatus.ACTIVE)
    
    GLib.timeout_add_seconds(1, handler_timeout, indicator)
    gtk.main()

def handler_timeout(indicator):
    indicator.set_label(set_CPU_label(), '')
    indicator.set_menu(build_menu())
    return True

def set_CPU_label(): 
    return check_output("sensors | grep 'Core 1' | awk '{print $3}' | sed 's/+//'", shell=True).strip()

def set_Fan_label():
    return check_output("sensors | grep cpu_fan | awk '{print $2 \" \" $3}'", shell=True).strip()

def build_menu():
    menu = gtk.Menu()
    item_quit = gtk.MenuItem('Quit')
    item_quit.connect('activate', quit)
    item_fan = gtk.MenuItem("Fan Speed: " + set_Fan_label())
    menu.append(item_fan)
    menu.append(item_quit)
    menu.show_all()
    return menu

def quit(source):
    gtk.main_quit()

if __name__ == '__main__':
    main()
