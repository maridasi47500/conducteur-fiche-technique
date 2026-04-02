class Conducteurline < ApplicationRecord
belongs_to :conducteur
def maduree
x=read_attribute(:duree)
("%02d" % x.hour+":"+ "%02d" % x.min)
end
def videoprojection=(uploaded_io)

File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
  file.write(uploaded_io.read)
end
write_attribute(:videoprojection, uploaded_io.original_filename)
rescue => e
write_attribute(:videoprojection, uploaded_io)
end
def videoprojection
read_attribute(:videoprojection)
end
def son=(uploaded_io)

File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
  file.write(uploaded_io.read)
end
write_attribute(:son, uploaded_io.original_filename)
rescue => e
write_attribute(:videoprojection, uploaded_io)
end
def son
read_attribute(:son)
end
end
