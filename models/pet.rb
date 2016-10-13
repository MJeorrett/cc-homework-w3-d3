require_relative('../db/sql_runner')

class Pet

  attr_reader :id
  attr_accessor :name, :type, :pet_store_id

  def initialize(options)
    @id = options['id'].to_i if options['id'] != nil
    @name = options['name']
    @type = options['type']
    @pet_store_id = options['pet_store_id']
  end

  def save()
    sql =
    "INSERT INTO pets(name, type, pet_store_id)
      VALUES (
        '#{@name}',
        '#{@type}',
        #{pet_store_id}
      ) RETURNING id"
    result = SqlRunner.run( sql ).first
    @id = result['id']
  end

  def update()
    if @id
      sql =
      "UPDATE pets SET
        name = '#{@name}',
        type = '#{@type}',
        pet_store_id = #{@pet_store_id}
      WHERE id = #{@id}"
      SqlRunner.run( sql )
    else
      save()
    end
  end

  def delete()
    sql = "DELETE FROM pets WHERE id = #{@id}"
    SqlRunner.run( sql )
  end

  def pet_store()
    return PetStore.find_by_id(@pet_store_id)
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM pets WHERE id = #{id}"
    pet_data = SqlRunner.run( sql ).first
    return Pet.new(pet_data)
  end

  def self.find_all_with_pet_store_id(pet_store_id)
    sql = "SELECT * FROM pets WHERE pet_store_id = #{pet_store_id}"
    pets_data = SqlRunner.run( sql )
    return pets_data.map { |pet_data| Pet.new( pet_data )}
  end

  def self.all()
    sql = "SELECT * FROM pets"
    pets_data = SqlRunner.run( sql )
    return pets_data.map { |pet_data| Pet.new( pet_data ) }
  end

end
