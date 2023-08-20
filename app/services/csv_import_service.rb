class CsvImportService
  require 'csv'
  require 'open-uri'

  def call(file)
    temp_holder = []
    # opened_file = File.open(file)
    opened_file = URI.open(file)
    options = { headers: true, col_sep: ',' }
    CSV.foreach(opened_file, **options) do |row|
      10.times do 
        casio_data_hash = {}
        casio_data_hash[:date] = row['date']
        casio_data_hash[:time] = row['time']
        casio_data_hash[:imports_c02] = row['imports_c02']
        casio_data_hash[:biogas_co2] = row['biogas_co2']
        casio_data_hash[:natural_gas_c02] = row['natural_gas_c02']
        casio_data_hash[:geothermal_c02] = row['geothermal_c02']
        casio_data_hash[:coal_c02] = row['coal_c02']

        temp_holder.push(casio_data_hash)
      end
    end
    temp_holder
  end
end