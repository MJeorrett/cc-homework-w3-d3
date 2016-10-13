require_relative('./models/pet')
require_relative('./models/pet_store')

require('pry-byebug')

# pet stores
pet_world = PetStore.new( 'name' => "Pet World", 'stock_type' => "house pets", 'address' => "CodeClan HQ, Edinburgh")
pet_world.save()

jamies_pets = PetStore.new( 'name' => "Jamie''s Pets", 'stock_type' => "tropical", 'address' => "13 Pet Street, Pet Town, Petsylvania")
jamies_pets.save()

# pets
bugs_bunny = Pet.new( 'name' => "Bugs Bunny", 'type' => "rabbit", 'pet_store_id' => pet_world.id)
bugs_bunny.save()

donald_duck = Pet.new( 'name' => "Donald Duck", 'type' => "duck", 'pet_store_id' => pet_world.id)
donald_duck.save()

percy_parrot = Pet.new( 'name' => "Percy", 'type' => "parrot", 'pet_store_id' => jamies_pets.id)
percy_parrot.save()

terry_fish = Pet.new( 'name' => "Terry", 'type' => "tropical fish", 'pet_store_id' => jamies_pets.id)
terry_fish.save()

timothy = Pet.new( 'name' => "Timothy", 'type' => "tarantula", 'pet_store_id' => jamies_pets.id)
timothy.save()

binding.pry
nil
