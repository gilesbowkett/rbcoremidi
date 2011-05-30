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
midi_in.capture {|data| puts "data #{data.inspect}"}

