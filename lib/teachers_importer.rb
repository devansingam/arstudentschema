require_relative '../app/models/student'

module TeacherImporter
  def self.import(filename=File.dirname(__FILE__) + "/../db/data/students.csv")
    field_names = nil
    Teacher.transaction do
      File.open(filename).each do |line|
        data = line.chomp.split(',')
        if field_names.nil?
          field_names = data
        else
          attribute_hash = Hash[field_names.zip(data)]
          teacher = Teacher.create!(attribute_hash)
        end
      end
    end
  end
end
