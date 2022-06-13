# This is a sample quisk_conf.py configuration file for a SoftRock Rx Ensemble II or
# other SoftRock that has receive only capability.  No Tx.  The single sound card
# is used for radio sample capture, and playing radio sound.  Of course, if you have
# two sound cards, you can play radio sound on the other one, preferably at 48000 sps.

# Please do not change this sample file.
# Instead copy it to your own config file and make changes there.
# See quisk_conf_defaults.py for more information.

from softrock import hardware_usb as quisk_hardware
from softrock import widgets_tx   as quisk_widgets

del quisk_hardware.Hardware.OnSpot			# Remove this transmit feature
del quisk_hardware.Hardware.OnButtonPTT		# Remove this transmit feature

default_screen = 'WFall'

graph_width = 0.8

# This controls the speed of the graph peak hold.  Lower numbers give a longer time constant.
graph_peak_hold_1 = 0.25
graph_peak_hold_2 = 0.10

# Select the default mode when Quisk starts (overruled by persistent_state):
# default_mode = 'FM'
default_mode = 'LSB'

# Select the way the waterfall screen scrolls:
# waterfall_scroll_mode = 0	#  scroll at a constant rate.
waterfall_scroll_mode = 0	# scroll faster at the top so that a new signal appears sooner.
# Select the initial size in pixels (minimum 1) of the graph at the top of the waterfall.
waterfall_graph_size = 135

# These are the initial values for the Y-scale and Y-zero sliders for each screen.
# The sliders go from zero to 160.
graph_y_scale = 100
graph_y_zero  = 0
waterfall_y_scale = 40
waterfall_y_zero  = 0
waterfall_graph_y_scale = 100
waterfall_graph_y_zero = 60
scope_y_scale = 80
scope_y_zero  = 0		# Currently doesn't do anything
filter_y_scale = 90
filter_y_zero  = 0

# This converts from dB to S-units for the S-meter (it is in S-units).
correct_smeter = 21.1

# This is the fraction of spectrum to display from zero to one.  It is needed if
# the passband edges are not valid.  Use 0.85 for the SDR-IQ.
display_fraction = 1.00

# In ALSA, soundcards have these names.  The "hw" devices are the raw
# hardware devices, and should be used for soundcard capture.
#name_of_sound_capt = "hw:0"
#name_of_sound_capt = "hw:1"
#name_of_sound_capt = "plughw"
#name_of_sound_capt = "plughw:1"
#name_of_sound_capt = "default"

# Pulseaudio support added by Philip G. Lee.  Many thanks!
# For PulseAudio support, use the name "pulse" and connect the streams
# to your hardware devices using a program like pavucontrol
#name_of_sound_capt = "pulse"

softrock_model = "RxEnsemble2"
si570_direct_control = True
si570_xtal_freq = 114213790
#si570_i2c_address = 0x70

sample_rate = 96000							# ADC hardware sample rate in Hertz
name_of_sound_capt = "hw:0"
#name_of_sound_capt = "portaudio:(hw:0,2)"					# Name of soundcard capture hardware device.
name_of_sound_play = "default"		# Use the same device for radio sound play back
# There are no microphone devices.

# This is a dark color scheme designed by Steve Murphy, KB8RWQ.
color_bg                = '#111111'
color_graph             = '#111111'
color_config2           = color_bg
color_gl                = '#555555'
color_graphticks        = '#DDDDDD'
color_graphline         = '#00AA00'
color_graphlabels       = '#FFFFFF'
color_btn               = '#4D4D4D'
color_check_btn         = '#0000FF'
color_cycle_btn         = '#666699'
color_adjust_btn        = '#669999'
color_test              = 'red'
color_freq              = '#333333'
color_entry             = color_freq
color_enable            = 'white'
color_disable           = 'black'
color_bandwidth         = '#333333'
color_txline            = 'red'
color_rxline            = 'green'
