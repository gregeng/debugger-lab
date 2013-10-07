## changed the data structure to reference songs as an array without a key of songs.
## instead, the songs are just an array which is the value of the album key

def full_library
  {
    :"U2" => {
      :albums => {
        :"The Joshua Tree" => 
          ["With or Without You", "Still Haven't Found What I'm Looking For", "Bullet the Blue Sky"],
        :"Zooropa" => 
          ["Numb"]
        
       }
    },
    :"Talking Heads" => {
      :albums => {
        :"Fear of Music" => 
          ["Life During Wartime", "Heaven"],

        :"Speaking in Tongues" => 
          ["This Must Be the Place (Naive Melody)", "Burning Down the House"]
        
      }
    },
    :"Huey Lewis and the News" => {
      :albums => {
        :"Sports" => 
          ["I Want a New Drug", "If This is It", "Heart of Rock and Roll"]
        }
      }
    }
end
