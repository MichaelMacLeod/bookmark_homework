require_relative 'db_base' 
class Bookmark < DBBase
  attributes( { :name => :string } )

end

#NOTE: I'm pretty sure this page is wrong. Should the attributes be name, url and genre? 