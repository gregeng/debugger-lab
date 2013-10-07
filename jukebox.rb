# changed alot of the references to reference songs as the array.  
# updated several incorrectly named values from key value pairs 
# when iterating over the hashes.

require_relative './song_library.rb'

def jukebox(command)
  if command.downcase == "list"
    list_library
  else
    parse_command(command)
  end
end

def list_artist(artist, album_hash)
   artist_list = "\n---------------\n"
   artist_list += "#{artist}:\n"
   artist_list += "---------------"
   album_hash[:albums].each do |album_name, songs_array|
     artist_list += "\n#{album_name}:\n\t"
     artist_list += songs_array.join("\n\t")
   end
   artist_list
end

def list_library
  lib = full_library
  lib.each do |artist, album_hash|
    puts list_artist(artist, album_hash)
  end
end

def parse_command(command)
  parse_artist(command, full_library) || play_song(command, full_library) || not_found(command)
end

def parse_artist(command, lib)
  cmd = command.to_sym
  parsed = false
  if lib.has_key?(cmd)
    puts list_artist(command, lib[cmd])
    parsed = false
  else
    lib.each do |artist, hash|
      if command.downcase == artist.to_s.downcase
        puts list_artist(artist, hash)
        parsed = true
        break
      end
    end
  end
  parsed
end

def play_song(command, lib)
  lib.each do |artist, hash|
    hash.each do |album_name, albums_hash|
      albums_hash.each do |album, song_array|
        song_array.each do |song|
          if song.downcase == command.downcase
            puts "Now Playing: #{artist}: #{album} - #{song}\n"
            return true
          end
        end
      end
    end
  end
  false
end

def not_found(command)
  puts "I did not understand '#{command}'!\n\n"
  true
end 