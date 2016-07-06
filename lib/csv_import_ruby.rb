require 'csv'

def import_row(row, columns, options)
  values = Hash[columns.zip(row)]
  attributes = values.select{ |key, value| self.column_names.include?(key.to_s) }
  attributes.each{ |key, value| attributes[key] = value.strip } if options[:remove_whitespace]
  self.create(attributes)
end

def create_importer(*columns, options)
  self.instance_eval do
    define_singleton_method(:import!) do |csv|
      CSV.parse(csv) do |row|
        import_row(row, columns, options)
      end
    end

    define_singleton_method(:import_file!) do |file_name|
      CSV.foreach(file_name) do |row|
        import_row(row, columns, options)
      end
    end
  end
end
