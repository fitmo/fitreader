class FileHeader
  attr_accessor :header_size, :protocol_version,
  :profile_version, :num_records, :valid_file, :crc

  def initialize(bytes)
    @header_size = bytes[0].unpack('C').first
    @protocol_version = bytes[1].unpack('C').first
    @profile_version = bytes[2..3].unpack('v').first
    @num_records = bytes[4..7].unpack('V').first
    @valid_file = bytes[8..11] == ".FIT"
    @crc = bytes[12..13].unpack('v').first
  end

  def to_s
    "size: #{header_size}, proto_v: #{protocol_version}, prof_v: #{profile_version}, records: #{num_records}"
  end
end
