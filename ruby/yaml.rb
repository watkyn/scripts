
  def self.extract_table(table_name, name_for_file)
    require 'java'
    require 'sequel'
    
    db = Sequel.connect('jdbc:mysql://localhost/jamfsoftware?user=root')
    dataset = db["SELECT * FROM #{table_name}"]
    hash = { table_name => nil }
    dataset.each do |set|
      hash.merge( { table_name => set.to_hash} )
    end
    puts hash
    #yaml = { table_name => hash[nil]}.to_yaml
    #File.open("#{TEST_DATA_DIR}/databases/#{name_for_file}.db", 'w') { |f| f.write(yaml) } 
  end

  def self.load_db(db_file_name) 
    config = YAML::load_file("#{TEST_DATA_DIR}/databases/#{db_file_name}")
    config.each_key do |table_name|
      # truncate the table
      execute_sql("delete from #{table_name}")
      
      #insert the row into the table
      keys = config[table_name].keys
      values = config[table_name].values.collect { |value| convert_value(value) }
      sql = "insert into #{table_name} (#{keys.join(", ")}) values(#{values.join(", ")})"
      puts sql
    end
  end


  def self.convert_value(value)
    if value.kind_of?(String)
      return "'#{value}'"
    elsif value.kind_of?(Numeric)
      return value
    elsif value.kind_of?(TrueClass)
      return 1
    elsif value.kind_of?(FalseClass)
      return 0
    else 
      raise "the type was not found for: #{value} type: #{value.class}"
    end
  end
