class Conducteurline < ApplicationRecord
belongs_to :conducteur
def maduree
x=read_attribute(:duree)
("%02d" % x.hour+":"+ "%02d" % x.min)
end
end
