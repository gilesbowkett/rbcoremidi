require 'coremidi'
require 'midi_in'

# Start archaeopteryx 
# Start GarageBand (just to make sure it's all working)

# Open MIDI Patch Bay.app
# Create a new input (anyname)
# Create a new output (anyname)
# GarageBand will announce that it has found a new input
# You should have sound, yay

# Now run this script

midi_in = MidiIn.new
midi_in.scan
(0..15).to_a.each {|n| midi_in.link(n)}
midi_in.capture {}

# send messages back to the APC to control its LEDs:
# (via http://www.cycling74.com/forums/topic.php?id=20355#post-106507)

# The top left button on the 5x8 clip control grid is 144 53 1, where 144-151 is the entire top horizontal row, 53-57 is the vertical row going down (the next row down in this case is 54), and 1 is the velocity. The bottom Clip Stop row is 52.

# The Velocities are as follows
# 1 - Green
# 2 - Green Flashing
# 3 - Red
# 4 - Red Flashing
# 5 - Orange
# 6 - Orange Flashing

# 7-127 Are all green.

