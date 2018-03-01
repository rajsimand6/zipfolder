#!/usr/bin/env ruby

require 'rubygems'
require 'zip'

folder = "."
input_filenames = ['Test.txt']

zipfile_name = "./Test.zip"

Zip::File.open(zipfile_name, create: true) do |zipfile|
  input_filenames.each do |filename|
    # Two arguments:
    # - The name of the file as it will appear in the archive
    # - The original file, including the path to find it
    zipfile.add(filename, File.join(folder, filename))
  end
  zipfile.get_output_stream("myFile") { |f| f.write "myFile contains just this" }
end
