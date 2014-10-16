require "roo"
require "spreadsheet"

class SpreadsheetImporter
  attr_reader :file

  def initialize(file)
    @file = file
  end

  def process
    xls = Roo::Spreadsheet.open(file.path, extension: :xlsx)

    #Soft delete all gradautes
    Graduate.update_all(deleted_at: Time.now)

    skip_first_row = true
    xls.each do |row|
      if skip_first_row
        skip_first_row = false
        next
      end
      process_row(row)
    end

    #Force reload of Careers
    Career.all(true)
  end

  private
  def process_row(row)
    g = Graduate.not_deleted.where(dni:row[2]).first_or_initialize
    g.last_name = row[0]
    g.first_name = row[1]
    g.career_ids ||= []
    g.career_ids << Career.find_or_create_by_name(row[3]).id
    g.save
  end
end
