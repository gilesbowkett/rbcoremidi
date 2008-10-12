require 'coremidi'

class MidiIn
  include CoreMIDI

  def initialize
    # Names are arbitrary
    client = CoreMIDI.create_client("SB")
    @port = CoreMIDI.create_input_port(client, "PortA")
  end

  def scan
    CoreMIDI.sources.each_with_index do |source, index|
      puts "source #{index}: #{source}"
    end
  end

  def link(source)
    connect_source_to_port(source, @port) # 0 is index into CoreMIDI.sources array
  end

  def capture
    while true
     if data = new_data?
       yield data
     end
   end
  end
end

