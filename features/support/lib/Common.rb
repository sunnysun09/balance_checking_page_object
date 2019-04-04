require 'yaml'

class Common

    def read_yml_file(file_path)
        file_data = {}
        file_data = YAML.load(ERB.new(File.read(file_path)).result)
        raise "read yaml file fail" if file_data.empty?
        file_data
    end
end