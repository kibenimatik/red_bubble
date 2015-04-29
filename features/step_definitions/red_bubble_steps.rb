Then(/^the "([^"]*)" folder contains "([^"]*)" file$/) do |folder_name, file_name|
  step %(a directory named "#{folder_name}" should exist)
  step %(a file named "#{folder_name}/#{file_name}" should exist)
end
