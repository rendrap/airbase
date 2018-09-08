require "json"
require 'fileutils'
require 'yaml'
require 'airtable'

module Jekyll
  class AirtableSynchronizer < Generator
    priority :highest

    def generate(site)
      site.config['SYNC_WITH_AIRTABLE'] = true
      site.config['AIRTABLE_API_KEY']   = 'key'
      site.config['AIRTABLE_BASE_UID']  = 'appMK61yM6IiBJXkg'
      site.config['AIRTABLE_TABLE_NAMES'] = ['Bots', 'Categories']

      return false if site.config['AIRTABLE_API_KEY'].nil? || site.config['AIRTABLE_API_KEY'] == ''
      return false if site.config['SYNC_WITH_AIRTABLE'] == false

      Airtable.configure do |config|
        config.api_key = site.config['AIRTABLE_API_KEY']
      end

      client = Airtable.client(base_uid: site.config['AIRTABLE_BASE_UID'])

      site.config['AIRTABLE_TABLE_NAMES'].each do |table_name|
        records = JSON.parse(client.list_records(table_name: table_name, params: {}))
        next if records.size == 0

        records_as_json      = records['records']
        converted_table_name = table_name.split(' ').map(&:downcase).join('_')

        yaml_file = File.new("_data/airtable/#{converted_table_name}.yml", "w")
        yaml_file.write(
          YAML.dump(records_as_json)
        )
      end
    end
  end
end