require 'coremidi'
require 'midi_in'
require 'rubygems'
require 'active_support'

midi_in = MidiIn.new
midi_in.scan
midi_in.link(0)

midi_in.capture do |data|
  data[0].data.in_groups_of(3) do |unknown, midi_note_number, unknown|
    system("open http://boingboing.net") if 60 == midi_note_number
  end
end

